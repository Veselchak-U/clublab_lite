import 'package:clublab_lite/app/assets/assets.gen.dart';
import 'package:clublab_lite/app/l10n/l10n.dart';
import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/features/home/presentation/app_drawer/app_drawer_vm.dart';
import 'package:clublab_lite/features/home/presentation/app_drawer/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AppDrawerVm>();

    return Drawer(
      backgroundColor: AppColors.primary,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 24.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32).w,
              child: Image.asset(
                Assets.images.menuLogo.path,
                width: 150.w,
                // height: 50.h,
              ),
            ),
            SizedBox(height: 32.h),
            DrawerItem(
              title: context.l10n.settings,
              iconPath: Assets.icons.settings.path,
              onTap: vm.openSettingsScreen,
            ),
            // const Spacer(),
            SizedBox(height: 56.h),
            DrawerItem(
              title: context.l10n.sing_out,
              iconPath: Assets.icons.logout.path,
              onTap: vm.logout,
              hasDivider: false,
            ),
          ],
        ),
      ),
    );
  }
}
