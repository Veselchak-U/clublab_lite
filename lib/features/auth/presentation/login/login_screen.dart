import 'package:clublab_lite/app/assets/assets.gen.dart';
import 'package:clublab_lite/app/l10n/l10n.dart';
import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/app/style/app_text_styles.dart';
import 'package:clublab_lite/common/buttons/change_locale_button.dart';
import 'package:clublab_lite/common/buttons/common_button.dart';
import 'package:clublab_lite/common/form_fields/mobile_phone_text_field.dart';
import 'package:clublab_lite/common/layouts/app_scaffold.dart';
import 'package:clublab_lite/common/utils/input_validators.dart';
import 'package:clublab_lite/features/auth/presentation/login/login_screen_vm.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneFormatter = MaskTextInputFormatter(mask: '##-###-##-##');

  @override
  Widget build(BuildContext context) {
    final vm = context.read<LoginScreenVm>();

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
                    context.l10n.login,
                    style: AppTextStyles.s30w600,
                    // textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),
                  MobilePhoneTextField(
                    label: context.l10n.mobileNumber,
                    // prefixText: '+972 ',
                    hint: 'XX-XXX-XX-XX',
                    onChanged: (_) => vm.onPhoneChanged(
                      phoneFormatter.getUnmaskedText(),
                    ),
                    inputFormatters: [phoneFormatter],
                    validator: (_) => InputValidators.complexValidator(
                      phoneFormatter.getUnmaskedText(),
                      [
                        InputValidators.emptyValidator,
                        InputValidators.mobilePhoneValidator,
                      ],
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 24.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${context.l10n.notHaveAccount} ',
                          style: AppTextStyles.s12w400,
                        ),
                        TextSpan(
                          text: context.l10n.singUpChoose,
                          style: AppTextStyles.s12w400.copyWith(color: AppColors.primary),
                          recognizer: TapGestureRecognizer()..onTap = vm.goSignUp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.h),
                  ValueListenableBuilder(
                    valueListenable: vm.loading,
                    builder: (context, loading, _) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40).w,
                        child: CommonButton(
                          label: context.l10n.login,
                          onTap: vm.requestOtp,
                          loading: loading,
                        ),
                      );
                    },
                  ),
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
