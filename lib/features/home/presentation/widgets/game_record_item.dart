import 'package:clublab_lite/app/style/app_colors.dart';
import 'package:clublab_lite/app/style/app_text_styles.dart';
import 'package:clublab_lite/features/home/data/model/game_record_api_model.dart';
import 'package:clublab_lite/features/home/presentation/home_screen_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GameRecordItem extends StatelessWidget {
  final GameRecordApiModel record;

  const GameRecordItem({
    required this.record,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomeScreenVm>();

    final created = record.created;
    final day = created == null ? '' : DateFormat('dd').format(created);
    final month = created == null ? '' : DateFormat('MM/yyyy').format(created);
    final hours = created == null ? '' : DateFormat('Hm').format(created);

    return Container(
      padding: const EdgeInsets.only(left: 16).w,
      margin: const EdgeInsets.only(top: 4).h,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).w,
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      day,
                      style: AppTextStyles.s30w600,
                    ),
                    Text(
                      month,
                      style: AppTextStyles.s12w400,
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8).h,
                    child: Column(
                      children: [
                        Text(
                          hours,
                          style: AppTextStyles.s12w600.copyWith(color: AppColors.primary),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          record.fieldName,
                          style: AppTextStyles.s12w400,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.play_circle),
                  iconSize: 28,
                  color: AppColors.red,
                  onPressed: () => vm.openGameRecord(record),
                ),
                IconButton(
                  icon: const Icon(Icons.share_outlined),
                  iconSize: 28,
                  onPressed: () => vm.shareGameRecord(record),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
