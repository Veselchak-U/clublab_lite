import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/common/buttons/change_locale_button.dart';
import 'package:clublab_lite/common/layouts/app_scaffold.dart';
import 'package:clublab_lite/features/auth/presentation/verify_phone/verify_phone_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class VerifyPhoneScreen extends StatelessWidget {
  const VerifyPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<VerifyPhoneScreenVm>();

    return AppScaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          const Center(
            child: Text('VerifyPhoneScreen'),
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
