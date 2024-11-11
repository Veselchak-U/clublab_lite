import 'package:clublab_lite/app/l10n/l10n.dart';
import 'package:clublab_lite/app/navigation/app_route.dart';
import 'package:clublab_lite/app/service/logger/logger_service.dart';
import 'package:clublab_lite/common/dialogs/app_dialogs.dart';
import 'package:clublab_lite/common/overlays/app_overlays.dart';
import 'package:clublab_lite/features/auth/data/repository/auth_repository.dart';
import 'package:clublab_lite/features/initial/data/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreenVm {
  final BuildContext _context;
  final UserRepository _userRepository;
  final AuthRepository _authRepository;

  SettingsScreenVm(
    this._context,
    this._userRepository,
    this._authRepository,
  ) {
    _init();
  }

  final loading = ValueNotifier<bool>(false);

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

  Future<void> deleteAccount() async {
    final dialogResult = await AppDialogs.showConfirmationDialog(
      context: _context,
      title: _context.l10n.delete_account,
      description: _context.l10n.sure_to_delete,
      confirmLabel: _context.l10n.yes,
      cancelLabel: _context.l10n.no,
    );
    if (dialogResult != true) return;

    _setLoading(true);
    try {
      await _authRepository.deleteAccount();

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
