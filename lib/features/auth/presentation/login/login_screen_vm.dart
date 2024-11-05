import 'package:clublab_lite/common/overlays/app_overlays.dart';
import 'package:flutter/material.dart';

class LoginScreenVm {
  final BuildContext _context;

  LoginScreenVm(
    this._context,
  ) {
    _init();
  }

  final loading = ValueNotifier<bool>(true);

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
