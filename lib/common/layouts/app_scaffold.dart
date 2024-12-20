import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/common/layouts/focus_layout.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Color backgroundColor;
  final bool resizeToAvoidBottomInset;

  const AppScaffold({
    required this.body,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
    this.backgroundColor = AppColors.background,
    this.resizeToAvoidBottomInset = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FocusLayout(
      child: ColoredBox(
        color: backgroundColor,
        child: Scaffold(
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          appBar: appBar,
          drawer: drawer,
          body: SafeArea(
            child: body,
          ),
          bottomNavigationBar: bottomNavigationBar,
        ),
      ),
    );
  }
}
