import 'package:clublab_lite/app/style/app_app_bar.dart';
import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/common/layouts/app_scaffold.dart';
import 'package:clublab_lite/features/home/presentation/home_screen_vm.dart';
import 'package:clublab_lite/features/home/presentation/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomeScreenVm>();

    return const AppScaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(),
      drawer: HomeDrawer(),
      body: Column(
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
