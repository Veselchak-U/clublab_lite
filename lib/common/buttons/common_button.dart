import 'dart:math';

import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/app/style/app_text_styles.dart';
import 'package:clublab_lite/common/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

enum CommonButtonType { primary, transparent, bordered, danger }

class CommonButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final TextStyle? textStyle;
  final String? iconPath;
  final bool loading;
  final CommonButtonType type;

  const CommonButton({
    required this.label,
    required this.onTap,
    this.textStyle,
    this.iconPath,
    this.loading = false,
    this.type = CommonButtonType.primary,
    super.key,
  });

  bool get _isDisabled => onTap == null || loading;

  BorderRadius get _borderRadius => BorderRadius.circular(10).r;

  Decoration get _decoration {
    final baseDecoration = BoxDecoration(
      borderRadius: _borderRadius,
    );

    return _isDisabled
        ? baseDecoration.copyWith(
            color: AppColors.disabled,
          )
        : switch (type) {
            CommonButtonType.primary => baseDecoration.copyWith(
                color: AppColors.green,
              ),
            CommonButtonType.transparent => baseDecoration.copyWith(),
            CommonButtonType.bordered => baseDecoration.copyWith(
                color: AppColors.white,
                border: Border.all(color: AppColors.green),
              ),
            CommonButtonType.danger => baseDecoration.copyWith(),
          };
  }

  Color get foregroundColor {
    return _isDisabled
        ? AppColors.disabled
        : switch (type) {
            CommonButtonType.primary => AppColors.white,
            CommonButtonType.transparent => AppColors.green,
            CommonButtonType.bordered => AppColors.green,
            CommonButtonType.danger => Colors.red,
          };
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: max(48, 48.h),
          decoration: _decoration,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _isDisabled ? null : onTap,
              borderRadius: _borderRadius,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconPath != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16).r,
                          child: SvgPicture.asset(
                            iconPath ?? '',
                            width: 24.r,
                            height: 24.r,
                            colorFilter: ColorFilter.mode(foregroundColor, BlendMode.srcIn),
                          ),
                        )
                      : SizedBox(width: 16.r),
                  Text(
                    label,
                    style: textStyle ?? AppTextStyles.s12w600.copyWith(color: foregroundColor),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(width: 16.r),
                ],
              ),
            ),
          ),
        ),
        loading ? const LoadingIndicator() : const SizedBox.shrink(),
      ],
    );
  }
}
