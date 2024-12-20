import 'dart:math';

import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/app/style/app_text_styles.dart';
import 'package:clublab_lite/common/form_fields/app_field_header.dart';
import 'package:clublab_lite/common/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? prefixIconPath;
  final Color? prefixIconColor;
  final String? suffixIconPath;
  final Color? suffixIconColor;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final bool enabled;
  final bool filled;
  final VoidCallback? onTap;
  final int minLines;
  final int maxLines;
  final FocusNode? focusNode;
  final bool obscureText;
  final Color? background;
  final String? description;
  final bool loading;
  final bool isRequired;

  const AppTextField({
    this.label,
    this.hint,
    this.prefixIconPath,
    this.prefixIconColor,
    this.suffixIconPath,
    this.suffixIconColor,
    this.suffixIcon,
    this.controller,
    this.initialValue,
    this.inputFormatters,
    this.validator,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.readOnly = false,
    this.enabled = true,
    this.filled = false,
    this.onTap,
    this.minLines = 1,
    this.maxLines = 1,
    this.focusNode,
    this.obscureText = false,
    this.background,
    this.description,
    this.loading = false,
    this.isRequired = true,
    super.key,
  }) : assert(suffixIconPath == null || suffixIcon == null, 'Cannot provide both: "suffixIconPath" and "suffixIcon"');

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final _formFieldKey = GlobalKey<FormFieldState<String>>();

  late final TextEditingController controller;
  late final bool isInnerController;

  late final FocusNode focusNode;
  late final bool isInnerFocusNode;
  final hasFocus = ValueNotifier<bool>(false);

  String lastValue = '';

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    isInnerController = widget.controller == null;
    controller.addListener(_textControllerListener);

    focusNode = widget.focusNode ?? FocusNode();
    isInnerFocusNode = widget.focusNode == null;
    focusNode.addListener(_focusListener);
  }

  @override
  void dispose() {
    controller.removeListener(_textControllerListener);
    if (isInnerController) controller.dispose();

    focusNode.removeListener(_focusListener);
    if (isInnerFocusNode) focusNode.dispose();
    hasFocus.dispose();
    super.dispose();
  }

  void _textControllerListener() {
    if (controller.text == lastValue) return;

    lastValue = controller.text;
    _formFieldKey.currentState?.didChange(lastValue);
    widget.onChanged?.call(lastValue);
  }

  void _focusListener() {
    hasFocus.value = focusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hasFocus,
      builder: (context, hasFocus, _) {
        return FormField<String>(
          key: _formFieldKey,
          initialValue: controller.text,
          validator: widget.validator,
          autovalidateMode: widget.autovalidateMode,
          builder: (formState) {
            final hasError = formState.hasError;

            final borderColor = hasError
                ? AppColors.red
                : hasFocus
                    ? AppColors.green
                    : AppColors.primaryLight;

            final headerText = hasError ? formState.errorText : null;
            final headerTextColor = hasError ? AppColors.red : AppColors.black.withOpacity(widget.enabled ? 1 : 0.5);

            final prefixIconPath = widget.prefixIconPath;
            final prefixIconColor = widget.prefixIconColor?.withOpacity(widget.enabled ? 1 : 0.5);
            final suffixIconPath = widget.suffixIconPath;
            final suffixIconColor = widget.suffixIconColor?.withOpacity(widget.enabled ? 1 : 0.5);

            Widget suffixIcon = SizedBox(width: max(24, 24.r));

            if (suffixIconPath != null) {
              suffixIcon = Padding(
                padding: EdgeInsetsDirectional.only(start: 8.r, end: 20.r),
                child: SvgPicture.asset(
                  suffixIconPath,
                  width: max(24, 24.r),
                  height: max(24, 24.r),
                  fit: BoxFit.scaleDown,
                  colorFilter: suffixIconColor == null ? null : ColorFilter.mode(suffixIconColor, BlendMode.srcIn),
                ),
              );
            } else if (widget.suffixIcon != null) {
              suffixIcon = widget.suffixIcon ?? const SizedBox.shrink();
            }

            final outerHeight = widget.minLines == 1 ? max(58.0, 58.h) : (widget.minLines * 21.h) + (58 - 21).h;
            final innerHeight = widget.minLines == 1 ? max(48.0, 48.h) : (widget.minLines * 21.h) + (48 - 21).h;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  style: AppTextStyles.s14w400.copyWith(color: headerTextColor),
                  TextSpan(
                    children: [
                      TextSpan(
                        text: widget.label ?? '',
                      ),
                      if (widget.isRequired)
                        TextSpan(
                          text: '\u{00A0}*',
                          style: AppTextStyles.s14w400.copyWith(color: AppColors.red),
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: outerHeight,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: innerHeight,
                        decoration: BoxDecoration(
                          color: widget.background ?? AppColors.white,
                          borderRadius: BorderRadius.circular(8).r,
                          border: Border.all(color: borderColor, width: 1),
                          // boxShadow: widget.enabled ? [shadow] : null,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8).r,
                          onTap: widget.onTap,
                          child: Row(
                            children: [
                              prefixIconPath == null
                                  ? SizedBox(width: max(24, 24.r))
                                  : Padding(
                                      padding: EdgeInsetsDirectional.only(start: 20.r, end: 8.r),
                                      child: SvgPicture.asset(
                                        prefixIconPath,
                                        width: max(24, 24.r),
                                        height: max(24, 24.r),
                                        fit: BoxFit.scaleDown,
                                        colorFilter: prefixIconColor == null
                                            ? null
                                            : ColorFilter.mode(prefixIconColor, BlendMode.srcIn),
                                      ),
                                    ),
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    TextField(
                                      focusNode: widget.readOnly ? null : focusNode,
                                      onTapOutside: widget.readOnly ? null : (_) => focusNode.unfocus,
                                      controller: controller,
                                      readOnly: widget.readOnly || widget.loading,
                                      enabled: widget.enabled,
                                      obscureText: widget.obscureText,
                                      ignorePointers: widget.readOnly,
                                      minLines: widget.minLines,
                                      maxLines: widget.maxLines,
                                      inputFormatters: widget.inputFormatters,
                                      keyboardType: widget.keyboardType,
                                      textInputAction: widget.textInputAction ?? TextInputAction.next,
                                      style: AppTextStyles.s14w400.copyWith(
                                        color: AppColors.black.withOpacity(widget.enabled ? 1 : 0.5),
                                      ),
                                      decoration: InputDecoration(
                                        // labelText: labelText,
                                        // labelStyle: AppTextStyles.s14w400.copyWith(
                                        //   color: AppColors.textBlack.withOpacity(widget.enabled ? 1 : 0.5),
                                        // ),
                                        floatingLabelBehavior: FloatingLabelBehavior.never,
                                        hintText: widget.readOnly || !widget.enabled ? null : widget.hint,
                                        hintStyle: AppTextStyles.s14w400.copyWith(color: AppColors.disabled),
                                        alignLabelWithHint: widget.minLines > 1,
                                        border: InputBorder.none,
                                        filled: widget.filled,
                                      ),
                                    ),
                                    if (widget.loading) const LoadingIndicator(),
                                  ],
                                ),
                              ),
                              suffixIcon,
                            ],
                          ),
                        ),
                      ),
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        top: 0,
                        start: 16.w,
                        child: AppFieldHeader(
                          text: headerText,
                          color: headerTextColor.withOpacity(widget.enabled ? 1 : 0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                widget.description != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 4).h,
                        child: Text(
                          widget.description ?? '',
                          style: AppTextStyles.s12w400.copyWith(color: headerTextColor),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        );
      },
    );
  }
}
