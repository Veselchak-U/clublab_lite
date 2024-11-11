import 'package:clublab_lite/app/service/logger/logger_service.dart';
import 'package:clublab_lite/common/overlays/app_overlays.dart';
import 'package:clublab_lite/features/auth/data/repository/auth_repository.dart';
import 'package:clublab_lite/features/home/data/model/game_record_api_model.dart';
import 'package:clublab_lite/features/home/data/repository/game_record_repository.dart';
import 'package:flutter/material.dart';

class HomeScreenVm {
  final BuildContext _context;
  final AuthRepository authRepository;
  final GameRecordRepository _gameRecordRepository;

  HomeScreenVm(
    this._context,
    this.authRepository,
    this._gameRecordRepository,
  ) {
    _init();
  }

  final loading = ValueNotifier<bool>(true);
  final gameRecords = ValueNotifier<List<GameRecordApiModel>>([]);

  void _init() {
    refreshGameRecords();
  }

  void dispose() {
    loading.dispose();
  }

  Future<void> refreshGameRecords() async {
    _setLoading(true);
    try {
      final result = await _gameRecordRepository.fetchGameRecords();

      if (!_context.mounted) return;
      gameRecords.value = result;
    } on Object catch (e, st) {
      LoggerService().e(error: e, stackTrace: st);
      _onError('$e');
    }
    _setLoading(false);
  }

  void openGameRecord(GameRecordApiModel record) {
    //=> context.router.push(GameVideoRoute(record: record)),
  }

  void shareGameRecord(GameRecordApiModel record) {
    // () => Share.shareUri(Uri.parse(record.url)),
  }

  void _setLoading(bool value) {
    if (!_context.mounted) return;
    loading.value = value;
  }

  void _onError(String message) {
    if (!_context.mounted) return;
    AppOverlays.showErrorBanner(message);
  }
}
