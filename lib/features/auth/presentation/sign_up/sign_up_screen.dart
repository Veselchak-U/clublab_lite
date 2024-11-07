import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/common/buttons/change_locale_button.dart';
import 'package:clublab_lite/common/layouts/app_scaffold.dart';
import 'package:clublab_lite/features/auth/presentation/sign_up/sign_up_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<SignUpScreenVm>();

    return AppScaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          const Center(
            child: Text('SignUpScreen'),
          ),
          Positioned(
            top: 12.r,
            right: 12.r,
            child: const ChangeLocaleButton(),
          ),
        ],
      ),
    );
  }
}
