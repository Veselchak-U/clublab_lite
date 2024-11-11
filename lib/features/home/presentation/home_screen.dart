import 'package:clublab_lite/app/l10n/l10n.dart';
import 'package:clublab_lite/app/style/app_app_bar.dart';
import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/common/layouts/app_scaffold.dart';
import 'package:clublab_lite/common/widgets/loading_container_indicator.dart';
import 'package:clublab_lite/features/home/presentation/app_drawer/app_drawer.dart';
import 'package:clublab_lite/features/home/presentation/app_drawer/app_drawer_vm.dart';
import 'package:clublab_lite/features/home/presentation/home_screen_vm.dart';
import 'package:clublab_lite/features/home/presentation/widgets/game_record_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomeScreenVm>();

    return AppScaffold(
      backgroundColor: AppColors.background,
      appBar: AppAppBar(
        titleText: context.l10n.game_records,
      ),
      drawer: Provider(
        lazy: false,
        create: (context) => AppDrawerVm(
          context,
          vm.authRepository,
        ),
        dispose: (context, vm) => vm.dispose(),
        child: const AppDrawer(),
      ),
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: vm.gameRecords,
            builder: (context, gameRecords, _) {
              if (gameRecords.isEmpty) {
                return Center(
                  child: Text(context.l10n.no_videos),
                );
              }

              return RefreshIndicator(
                onRefresh: vm.refreshGameRecords,
                child: ListView.separated(
                  itemCount: gameRecords.length,
                  itemBuilder: (context, index) => GameRecordItem(record: gameRecords[index]),
                  separatorBuilder: (_, __) => const Divider(),
                ),
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: vm.loading,
            builder: (context, loading, _) {
              return LoadingContainerIndicator(loading: loading);
            },
          ),
        ],
      ),
    );
  }
}
