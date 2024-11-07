import 'package:clublab_lite/app/navigation/app_route.dart';
import 'package:clublab_lite/app/service/logger/logger_service.dart';
import 'package:clublab_lite/common/overlays/app_overlays.dart';
import 'package:clublab_lite/features/auth/data/repository/auth_repository.dart';
import 'package:clublab_lite/features/auth/presentation/verify_phone/verify_phone_screen_params.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerifyPhoneScreenVm {
  final BuildContext _context;
  final AuthRepository _authRepository;
  final VerifyPhoneScreenParams params;

  VerifyPhoneScreenVm(
    this._context,
    this._authRepository, {
    required this.params,
  }) {
    _init();
  }

  final loading = ValueNotifier<bool>(false);

  final codeLength = 6;

  void _init() {}

  void dispose() {
    loading.dispose();
  }

  Future<void> onCodeChanged(String value) async {
    if (value.length != codeLength) return;

    _setLoading(true);
    try {
      await _authRepository.loginWithOtp(params.phone, value);

      if (!_context.mounted) return;
      _context.goNamed(AppRoute.home.name);
    } on Object catch (e, st) {
      LoggerService().e(error: e, stackTrace: st);
      _onError('$e');
    }
    _setLoading(false);
  }

  Future<void> resendCode() async {
    _setLoading(true);
    try {
      await _authRepository.requestOtp(params.phone);
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
