import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/app/style/app_text_styles.dart';
import 'package:clublab_lite/common/buttons/change_locale_button.dart';
import 'package:flutter/material.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final TextStyle? titleTextStyle;
  final Widget? title;
  final bool automaticallyImplyLeading;
  final bool addChangeLocaleButton;
  final Widget? leading;
  final Color backgroundColor;
  final Color foregroundColor;
  final List<Widget> actions;
  final ShapeBorder? shape;

  const AppAppBar({
    this.titleText,
    this.titleTextStyle,
    this.title,
    this.automaticallyImplyLeading = true,
    this.addChangeLocaleButton = true,
    this.leading,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor = AppColors.primaryWhite,
    this.actions = const [],
    this.shape,
    super.key,
  }) : assert(titleText == null || title == null, 'Cannot provide both: "titleText" and "title"');

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      shape: shape,
      title: title ??
          Text(
            titleText ?? '',
            style: titleTextStyle ?? AppTextStyles.s16w400.copyWith(color: foregroundColor),
          ),
      centerTitle: true,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leading,
      actions: addChangeLocaleButton ? [const ChangeLocaleButton(), ...actions] : actions,
    );
  }
}
