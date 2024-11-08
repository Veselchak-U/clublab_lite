import 'package:clublab_lite/app/l10n/l10n.dart';
import 'package:clublab_lite/app/style/app_app_bar.dart';
import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/app/style/app_text_styles.dart';
import 'package:clublab_lite/common/layouts/app_scaffold.dart';
import 'package:clublab_lite/common/utils/input_formatters.dart';
import 'package:clublab_lite/common/widgets/loading_container_indicator.dart';
import 'package:clublab_lite/features/auth/presentation/verify_phone/verify_phone_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class VerifyPhoneScreen extends StatelessWidget {
  const VerifyPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<VerifyPhoneScreenVm>();

    return AppScaffold(
      backgroundColor: AppColors.white,
      appBar: const AppAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32).w,
            child: Column(
              children: [
                SizedBox(height: 32.h),
                Text(
                  context.l10n.enterCodeTitle,
                  style: AppTextStyles.s30w600,
                  textAlign: TextAlign.center,
                ),
                Text(
                  vm.params.fullPhone,
                  style: AppTextStyles.s14w500,
                  textDirection: TextDirection.ltr,
                ),
                SizedBox(height: 26.h),
                Text(
                  context.l10n.verificationCode,
                  style: AppTextStyles.s14w500,
                ),
                SizedBox(height: 22.h),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: AppTextStyles.s24w400,
                    length: vm.codeLength,
                    obscureText: false,
                    onChanged: vm.onCodeChanged,
                    animationType: AnimationType.fade,
                    autoDismissKeyboard: false,
                    autoFocus: true,
                    inputFormatters: [InputFormatters.onlyDigits],
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      borderRadius: BorderRadius.circular(8).r,
                      borderWidth: 1,
                      fieldHeight: 60.h,
                      fieldWidth: 40.w,
                      activeColor: AppColors.primary,
                      selectedColor: AppColors.primary,
                      inactiveColor: AppColors.hint,
                      disabledColor: AppColors.hint,
                      activeFillColor: AppColors.white,
                      selectedFillColor: AppColors.white,
                      inactiveFillColor: AppColors.white,
                    ),
                    cursorColor: AppColors.primary,
                    animationDuration: const Duration(milliseconds: 250),
                    enableActiveFill: true,
                    textStyle: AppTextStyles.s24w400,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: 16.h),
                TextButton(
                  onPressed: vm.resendCode,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8).w,
                    child: Text(
                      context.l10n.resendCode,
                      style: AppTextStyles.s14w500.copyWith(color: AppColors.primary),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
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
