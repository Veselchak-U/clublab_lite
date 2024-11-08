import 'package:clublab_lite/app/assets/assets.gen.dart';
import 'package:clublab_lite/app/l10n/l10n.dart';
import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/app/style/app_text_styles.dart';
import 'package:clublab_lite/common/buttons/change_locale_button.dart';
import 'package:clublab_lite/common/buttons/common_button.dart';
import 'package:clublab_lite/common/form_fields/app_text_field.dart';
import 'package:clublab_lite/common/form_fields/mobile_phone_text_field.dart';
import 'package:clublab_lite/common/layouts/app_scaffold.dart';
import 'package:clublab_lite/common/utils/input_validators.dart';
import 'package:clublab_lite/features/auth/presentation/sign_up/sign_up_screen_vm.dart';
import 'package:flutter/gestures.dart';
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
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Form(
              key: vm.formKey,
              child: Column(
                children: [
                  SizedBox(height: 112.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32).w,
                    child: Image(
                      image: AssetImage(Assets.images.loginLogo.path),
                    ),
                  ),
                  SizedBox(height: 37.h),
                  Text(
                    context.l10n.registration,
                    style: AppTextStyles.s30w600,
                  ),
                  SizedBox(height: 35.h),
                  AppTextField(
                    label: context.l10n.fullName,
                    hint: context.l10n.enterName,
                    validator: InputValidators.emptyValidator,
                    onChanged: (value) => vm.fullName = value,
                  ),
                  SizedBox(height: 12.h),
                  MobilePhoneTextField(
                    label: context.l10n.phone,
                    hint: 'XX-XXX-XX-XX',
                    phonePrefix: vm.phonePrefix,
                    inputFormatters: [vm.phoneFormatter],
                    validator: (_) => InputValidators.complexValidator(
                      vm.phoneFormatter.getUnmaskedText(),
                      [
                        InputValidators.emptyValidator,
                        InputValidators.mobilePhoneValidator,
                      ],
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 12.h),
                  AppTextField(
                    label: context.l10n.email,
                    hint: context.l10n.enterEmail,
                    validator: InputValidators.emailValidator,
                    onChanged: (value) => vm.email = value,
                    isRequired: false,
                  ),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text.rich(
                      style: AppTextStyles.s12w400,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '*\u{00A0}',
                            style: AppTextStyles.s14w400.copyWith(color: AppColors.red),
                          ),
                          TextSpan(
                            text: context.l10n.mandatoryFields,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${context.l10n.haveAccount} ',
                          style: AppTextStyles.s12w400,
                        ),
                        TextSpan(
                          text: context.l10n.singInChoose,
                          style: AppTextStyles.s12w400.copyWith(color: AppColors.primary),
                          recognizer: TapGestureRecognizer()..onTap = vm.goLogin,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 36.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: context.l10n.termsAndPrivacy_1,
                          style: AppTextStyles.s12w400,
                        ),
                        TextSpan(
                          text: context.l10n.termsAndPrivacy_2,
                          style: AppTextStyles.s12w400.copyWith(color: AppColors.primary),
                          recognizer: TapGestureRecognizer()..onTap = vm.openTerms,
                        ),
                        TextSpan(
                          text: context.l10n.termsAndPrivacy_3,
                          style: AppTextStyles.s12w400,
                        ),
                        TextSpan(
                          text: context.l10n.termsAndPrivacy_4,
                          style: AppTextStyles.s12w400.copyWith(color: AppColors.primary),
                          recognizer: TapGestureRecognizer()..onTap = vm.openPrivacy,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  ValueListenableBuilder(
                    valueListenable: vm.loading,
                    builder: (context, loading, _) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40).w,
                        child: CommonButton(
                          label: context.l10n.registration,
                          onTap: vm.registration,
                          loading: loading,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
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
