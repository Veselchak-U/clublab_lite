import 'package:clublab_lite/app/l10n/l10n.dart';
import 'package:clublab_lite/common/overlays/app_overlays.dart';
import 'package:clublab_lite/features/initial/data/repository/user_repository.dart';
import 'package:flutter/material.dart';

class SettingsScreenVm {
  final BuildContext _context;
  final UserRepository _userRepository;

  SettingsScreenVm(
    this._context,
    this._userRepository,
  ) {
    _init();
  }

  final loading = ValueNotifier<bool>(true);

  void _init() {}

  void dispose() {
    loading.dispose();
  }

  Future<void> onLanguageChanged(LanguageNamedLocale? value) async {
    if (value == null) return;

    final newLocale = value.locale;
    _context.locale = newLocale;
    await _userRepository.setLocale(newLocale);
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
