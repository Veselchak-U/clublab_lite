import 'package:clublab_lite/app/navigation/app_route.dart';
import 'package:clublab_lite/app/service/logger/logger_service.dart';
import 'package:clublab_lite/common/overlays/app_overlays.dart';
import 'package:clublab_lite/features/auth/data/repository/auth_repository.dart';
import 'package:clublab_lite/features/auth/presentation/verify_phone/verify_phone_screen_params.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreenVm {
  final BuildContext _context;
  final AuthRepository _authRepository;

  LoginScreenVm(
    this._context,
    this._authRepository,
  ) {
    _init();
  }

  final loading = ValueNotifier<bool>(false);
  final formKey = GlobalKey<FormState>();

  String _phone = '';

  void _init() {}

  void dispose() {
    loading.dispose();
  }

  void onPhoneChanged(String value) {
    _phone = value;
  }

  void goSignUp() {
    _context.goNamed(AppRoute.signUp.name);
  }

  Future<void> requestOtp() async {
    final validForm = formKey.currentState?.validate();
    if (validForm == false) return;

    _setLoading(true);
    try {
      await _authRepository.requestOtp(_phone);

      if (!_context.mounted) return;
      _context.pushNamed(
        AppRoute.verifyPhone.name,
        extra: VerifyPhoneScreenParams(
          phone: _phone,
        ),
      );
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
