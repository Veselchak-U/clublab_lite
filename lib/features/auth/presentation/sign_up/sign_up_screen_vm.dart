import 'package:clublab_lite/app/l10n/l10n.dart';
import 'package:clublab_lite/app/navigation/app_route.dart';
import 'package:clublab_lite/app/service/logger/logger_service.dart';
import 'package:clublab_lite/common/overlays/app_overlays.dart';
import 'package:clublab_lite/common/utils/url_launcher.dart';
import 'package:clublab_lite/config.dart';
import 'package:clublab_lite/features/auth/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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

  final formKey = GlobalKey<FormState>();

  final phonePrefix = '+972  ';
  final phoneFormatter = MaskTextInputFormatter(mask: '##-###-##-##');

  String fullName = '';
  String? email;

  void _init() {}

  void dispose() {
    loading.dispose();
  }

  void goLogin() {
    _context.goNamed(AppRoute.login.name);
  }

  Future<void> openTerms() {
    final languageCode = _context.locale.languageCode;
    final url = Config.termsOfUseUrl(languageCode);

    return _openUrl(url);
  }

  Future<void> openPrivacy() {
    final languageCode = _context.locale.languageCode;
    final url = Config.privacyPolicyUrl(languageCode);

    return _openUrl(url);
  }

  Future<void> _openUrl(String url) async {
    try {
      await UrlLauncher.launchURL(url);
    } on Object catch (e, st) {
      LoggerService().e(error: e, stackTrace: st);
      _onError('$e');
    }
  }

  Future<void> registration() async {
    final validForm = formKey.currentState?.validate();
    if (validForm == false) return;

    _setLoading(true);
    try {
      await _authRepository.signUp(
        fullName: fullName,
        phone: phoneFormatter.getUnmaskedText(),
        email: email,
      );

      if (!_context.mounted) return;
      _context.goNamed(AppRoute.home.name);
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
