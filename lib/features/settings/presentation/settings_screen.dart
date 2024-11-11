import 'package:clublab_lite/app/l10n/gen/app_localizations.dart';
import 'package:clublab_lite/app/l10n/l10n.dart';
import 'package:clublab_lite/app/style/app_app_bar.dart';
import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/common/form_fields/app_dropdown_field.dart';
import 'package:clublab_lite/common/layouts/app_scaffold.dart';
import 'package:clublab_lite/features/settings/presentation/settings_screen_vm.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<LanguageNamedLocale> supportedLocales = [];
  LanguageNamedLocale? selectedLocale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initLocales();
  }

  void _initLocales() {
    supportedLocales = AppLocalizations.supportedLocales.map((e) => LanguageNamedLocale(e)).toList();
    final currentLocale = context.locale;
    selectedLocale = supportedLocales.firstWhereOrNull((e) => e.locale == currentLocale);
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.read<SettingsScreenVm>();

    return AppScaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(titleText: context.l10n.settings),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 32.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDropdownField<LanguageNamedLocale>(
              label: context.l10n.language,
              initialItem: selectedLocale,
              items: supportedLocales,
              isRequired: false,
              onChanged: vm.onLanguageChanged,
            ),
          ],
        ),
      ),
    );
  }
}
