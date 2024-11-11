import 'package:clublab_lite/app/style/app_app_bar.dart';
import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/common/layouts/app_scaffold.dart';
import 'package:clublab_lite/features/home/presentation/app_drawer/app_drawer.dart';
import 'package:clublab_lite/features/home/presentation/app_drawer/app_drawer_vm.dart';
import 'package:clublab_lite/features/home/presentation/home_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomeScreenVm>();

    return AppScaffold(
      backgroundColor: AppColors.background,
      appBar: const AppAppBar(),
      drawer: Provider(
        lazy: false,
        create: (context) => AppDrawerVm(
          context,
          vm.authRepository,
        ),
        dispose: (context, vm) => vm.dispose(),
        child: const AppDrawer(),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'HomeScreen',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
