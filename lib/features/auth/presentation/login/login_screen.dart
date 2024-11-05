import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/features/auth/presentation/login/login_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<LoginScreenVm>();

    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'LoginScreen',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
