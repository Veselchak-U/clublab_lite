import 'package:clublab_lite/common/overlays/app_overlays.dart';
import 'package:clublab_lite/features/auth/data/repository/auth_repository.dart';
import 'package:clublab_lite/features/auth/presentation/verify_phone/verify_phone_screen_params.dart';
import 'package:clublab_lite/features/initial/data/repository/user_repository.dart';
import 'package:flutter/material.dart';

class VerifyPhoneScreenVm {
  final BuildContext _context;
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  final VerifyPhoneScreenParams params;

  VerifyPhoneScreenVm(
    this._context,
    this._authRepository,
    this._userRepository, {
    required this.params,
  }) {
    _init();
  }

  final loading = ValueNotifier<bool>(false);

  void _init() {}

  void dispose() {
    loading.dispose();
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
