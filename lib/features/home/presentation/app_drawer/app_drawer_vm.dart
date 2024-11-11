import 'package:clublab_lite/app/l10n/l10n.dart';
import 'package:clublab_lite/app/navigation/app_route.dart';
import 'package:clublab_lite/app/service/logger/logger_service.dart';
import 'package:clublab_lite/common/dialogs/app_dialogs.dart';
import 'package:clublab_lite/common/overlays/app_overlays.dart';
import 'package:clublab_lite/features/auth/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppDrawerVm {
  final BuildContext _context;
  final AuthRepository _authRepository;

  AppDrawerVm(
    this._context,
    this._authRepository,
  ) {
    _init();
  }

  final loading = ValueNotifier<bool>(true);

  void _init() {}

  void dispose() {
    loading.dispose();
  }

  void openSettingsScreen() {
    _context.pop();
    _context.pushNamed(AppRoute.settings.name);
  }

  Future<void> logout() async {
    final result = await AppDialogs.showConfirmationDialog(
      context: _context,
      title: _context.l10n.sing_out,
      description: _context.l10n.sure_to_logout,
      confirmLabel: _context.l10n.yes,
      cancelLabel: _context.l10n.no,
    );
    if (result != true) return;

    _setLoading(true);
    try {
      await _authRepository.logout();

      if (!_context.mounted) return;
      _context.goNamed(AppRoute.login.name);
    } on Object catch (e, st) {
      LoggerService().e(error: e, stackTrace: st);
      _onError('$e');
    }
    _setLoading(false);
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
