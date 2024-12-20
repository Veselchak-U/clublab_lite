import 'dart:async';

import 'package:clublab_lite/app/di.dart';
import 'package:clublab_lite/app/l10n/l10n.dart';
import 'package:clublab_lite/app/navigation/app_navigation_observer.dart';
import 'package:clublab_lite/app/navigation/app_route.dart';
import 'package:clublab_lite/app/navigation/navigation_error_screen.dart';
import 'package:clublab_lite/app/service/logger/logger_service.dart';
import 'package:clublab_lite/common/overlays/app_overlays.dart';
import 'package:clublab_lite/features/auth/data/repository/auth_repository.dart';
import 'package:clublab_lite/features/auth/presentation/login/login_screen.dart';
import 'package:clublab_lite/features/auth/presentation/login/login_screen_vm.dart';
import 'package:clublab_lite/features/auth/presentation/verify_phone/verify_phone_screen.dart';
import 'package:clublab_lite/features/auth/presentation/verify_phone/verify_phone_screen_params.dart';
import 'package:clublab_lite/features/auth/presentation/verify_phone/verify_phone_screen_vm.dart';
import 'package:clublab_lite/features/home/data/repository/game_record_repository.dart';
import 'package:clublab_lite/features/home/presentation/home_screen.dart';
import 'package:clublab_lite/features/home/presentation/home_screen_vm.dart';
import 'package:clublab_lite/features/initial/data/repository/user_repository.dart';
import 'package:clublab_lite/features/initial/domain/logic/initial_controller.dart';
import 'package:clublab_lite/features/initial/presentation/initial_screen.dart';
import 'package:clublab_lite/features/initial/presentation/initial_screen_vm.dart';
import 'package:clublab_lite/features/settings/presentation/settings_screen.dart';
import 'package:clublab_lite/features/settings/presentation/settings_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppNavigation {
  static final _allowingWithoutAuthorization = [
    AppRoute.initial.path,
    AppRoute.login.path,
    // AppRoute.signUp.path,
    AppRoute.verifyPhone.path,
  ];

  static final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

  static Future<bool> _isUnauthorizedUser() async {
    final token = await DI.get<UserRepository>().getAccessToken();

    return token == null;
  }

  static void goToScreen({required String name}) {
    final context = _rootNavigatorKey.currentContext;
    if (context != null) {
      LoggerService().d('AppNavigation.goToScreen($name)');
      context.goNamed(name);
    } else {
      LoggerService().d('AppNavigation.goToScreen($name) cancelled - context == null');
    }
  }

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: AppRoute.initial.path,
    redirect: _redirect,
    observers: [DI.get<AppNavigationObserver>()],
    errorBuilder: (context, state) {
      LoggerService().e(message: 'AppNavigation', error: state.error, stackTrace: StackTrace.current);

      return NavigationErrorScreen(state.error);
    },
    routes: [
      GoRoute(
        name: AppRoute.initial.name,
        path: AppRoute.initial.path,
        pageBuilder: (context, state) => NoTransitionPage(
          child: Provider(
            lazy: false,
            create: (context) => InitialScreenVm(
              context,
              DI.get<InitialController>(),
            ),
            dispose: (context, vm) => vm.dispose(),
            child: const InitialScreen(),
          ),
        ),
      ),
      GoRoute(
        name: AppRoute.login.name,
        path: AppRoute.login.path,
        builder: (context, state) => Provider(
          lazy: false,
          create: (context) => LoginScreenVm(
            context,
            DI.get<AuthRepository>(),
          ),
          dispose: (context, vm) => vm.dispose(),
          child: const LoginScreen(),
        ),
      ),
      // GoRoute(
      //   name: AppRoute.signUp.name,
      //   path: AppRoute.signUp.path,
      //   builder: (context, state) => Provider(
      //     lazy: false,
      //     create: (context) => SignUpScreenVm(
      //       context,
      //       DI.get<AuthRepository>(),
      //     ),
      //     dispose: (context, vm) => vm.dispose(),
      //     child: const SignUpScreen(),
      //   ),
      // ),
      GoRoute(
        name: AppRoute.verifyPhone.name,
        path: AppRoute.verifyPhone.path,
        builder: (context, state) => Provider(
          lazy: false,
          create: (context) => VerifyPhoneScreenVm(
            context,
            DI.get<AuthRepository>(),
            params: state.extra as VerifyPhoneScreenParams,
          ),
          dispose: (context, vm) => vm.dispose(),
          child: const VerifyPhoneScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.home.name,
        path: AppRoute.home.path,
        builder: (context, state) => Provider(
          lazy: false,
          create: (context) => HomeScreenVm(
            context,
            DI.get<AuthRepository>(),
            DI.get<GameRecordRepository>(),
          ),
          dispose: (context, vm) => vm.dispose(),
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.settings.name,
        path: AppRoute.settings.path,
        builder: (context, state) => Provider(
          lazy: false,
          create: (context) => SettingsScreenVm(
            context,
            DI.get<UserRepository>(),
            DI.get<AuthRepository>(),
          ),
          dispose: (context, vm) => vm.dispose(),
          child: const SettingsScreen(),
        ),
      ),
    ],
  );

  static FutureOr<String?> _redirect(
    BuildContext context,
    GoRouterState state,
  ) async {
    LoggerService().d('AppNavigation navigate to "${state.uri.toString()}"');
    if (await _isUnauthorizedUser()) {
      final currentLocation = state.uri.toString();
      if (!_allowingWithoutAuthorization.contains(currentLocation)) {
        if (context.mounted) AppOverlays.showErrorBanner(context.l10n.go_to_login_screen);
        LoggerService().d('AppNavigation._redirect("${AppRoute.login.path}")');

        return AppRoute.login.path;
      }
    }

    return null;
  }
}
