import 'package:clublab_lite/app/assets/assets.gen.dart';
import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/common/widgets/loading_indicator.dart';
import 'package:clublab_lite/features/initial/presentation/initial_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<InitialScreenVm>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const Spacer(),
          Assets.images.appIconForeground.image(
            width: 192.w,
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: vm.loading,
              builder: (context, loading, _) {
                return switch (loading) {
                  true => const Center(child: LoadingIndicator()),
                  false => const Center(child: SizedBox.shrink()),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}
