import 'package:clublab_lite/app/style/app_app_bar.dart';
import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/common/layouts/app_scaffold.dart';
import 'package:clublab_lite/features/settings/presentation/settings_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<SettingsScreenVm>();

    return const AppScaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'SettingsScreen',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
