import 'package:clublab_lite/app/l10n/l10n.dart';
import 'package:clublab_lite/app/navigation/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class NavigationErrorScreen extends StatelessWidget {
  final Exception? error;

  const NavigationErrorScreen(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableText(error?.toString() ?? context.l10n.page_not_found),
            SizedBox(height: 32.h),
            ElevatedButton(
              onPressed: () => context.goNamed(AppRoute.initial.name),
              child: Text(context.l10n.to_initial_screen),
            ),
          ],
        ),
      ),
    );
  }
}
