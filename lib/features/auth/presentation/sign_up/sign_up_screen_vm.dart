import 'package:clublab_lite/common/overlays/app_overlays.dart';
import 'package:clublab_lite/features/auth/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class SignUpScreenVm {
  final BuildContext _context;
  final AuthRepository _authRepository;

  SignUpScreenVm(
    this._context,
    this._authRepository,
  ) {
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
