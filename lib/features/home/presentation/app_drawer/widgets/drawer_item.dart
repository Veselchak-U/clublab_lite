import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final String? iconPath;
  final Widget iconWidget;
  final bool hasDivider;

  const DrawerItem({
    required this.title,
    required this.onTap,
    this.iconPath,
    this.iconWidget = const SizedBox.shrink(),
    this.hasDivider = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        children: [
          Row(
            children: [
              iconPath != null
                  ? Padding(
                      padding: const EdgeInsets.all(12).r,
                      child: SvgPicture.asset(
                        iconPath ?? '',
                        width: 24.r,
                        height: 24.r,
                        colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                      ),
                    )
                  : iconWidget,
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          if (hasDivider) const Divider(color: AppColors.divider),
        ],
      ),
      onTap: onTap,
    );
  }
}
