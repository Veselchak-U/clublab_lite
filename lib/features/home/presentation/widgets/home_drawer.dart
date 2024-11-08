import 'package:clublab_lite/app/assets/assets.gen.dart';
import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primary,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: SizedBox(
                width: 150,
                height: 50,
                child: Image.asset(Assets.images.menuLogo.path),
              ),
            ),
            const SizedBox(height: 24),
            // MenuItem(
            //     title: 'menu_settings',
            //     onTap: () => context.router.popAndPush(const SettingsRoute()),
            //     iconSvgPath: 'assets/svg/ic_settings.svg'),
            // MenuItem(
            //   title: 'menu_profile',
            //   onTap: () => context.router.popAndPush(const ProfileRoute()),
            //   iconWidget: SizedBox(
            //     height: 48,
            //     width: 48,
            //     child: SvgPicture.asset(
            //       'assets/svg/menu_profile.svg',
            //       width: 18,
            //       colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            //     ),
            //   ),
            // ),
            const Spacer(),
            // MenuItem(
            //   title: 'menu_sing_out',
            //   onTap: () => _showLogoutDialog(context),
            //   hasDivider: false,
            //   iconSvgPath: 'assets/svg/ic_logout.svg',
            // ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  // Future<void> _showLogoutDialog(BuildContext context1) async {
  //   return showDialog<void>(
  //     context: context1,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(Localization.of(context).menu_sing_out),
  //         backgroundColor: AppColors.primaryBlueLight,
  //         content: Text(Localization.of(context).logout_desc),
  //         actions: <Widget>[
  //           TextButton(
  //             style: ButtonStyle(
  //               foregroundColor: MaterialStateProperty.all<Color>(AppColors.primaryBlue),
  //             ),
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: Text(Localization.of(context).logout_no),
  //           ),
  //           TextButton(
  //             style: ButtonStyle(
  //               foregroundColor: MaterialStateProperty.all<Color>(AppColors.primaryBlue),
  //             ),
  //             onPressed: () => _logout(context1),
  //             child: Text(Localization.of(context).logout_yes),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void _logout(BuildContext context) {
  //   return context.read<AuthBloc>().add(const AuthEvent.logout());
  // }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.onTap,
    required this.title,
    this.iconSvgPath,
    this.iconWidget,
    this.hasDivider = true,
  }) : assert(iconSvgPath != null || iconWidget != null);

  final String title;
  final String? iconSvgPath;
  final VoidCallback onTap;
  final Widget? iconWidget;
  final bool hasDivider;

  @override
  Widget build(BuildContext context) {
    final path = iconSvgPath;
    return ListTile(
      title: Column(
        children: [
          Row(
            children: [
              path != null
                  ? SizedBox(
                      width: 48,
                      height: 48,
                      child: SvgPicture.asset(
                        path,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    )
                  : iconWidget!,
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          if (hasDivider)
            const Divider(
              color: Color(0xFF3751CA),
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}
