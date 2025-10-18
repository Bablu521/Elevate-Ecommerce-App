import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/presentation/track_order/view_model/track_order_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimeLine extends StatelessWidget {
  const CustomTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.watch<TrackOrderViewModelCubit>();

    // تحديد index الحالة الحالية
    final currentIndex = cubit.orderStatus.indexOf(cubit.status);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cubit.statusTitle.length,
        itemBuilder: (context, index) {
          final title = cubit.statusTitle[index];

          final isFirst = index == 0;
          final isLast = index == cubit.statusTitle.length - 1;

          final isDone = index < currentIndex;
          final isCurrent = index == currentIndex;

          final color = isDone
              ? theme.colorScheme.primary
              : isCurrent
              ? theme.colorScheme.primary
              : AppColors.white[60]!;

          return TimelineTile(
            alignment: TimelineAlign.start,
            isFirst: isFirst,
            isLast: isLast,
            lineXY: 0.1,
            beforeLineStyle: LineStyle(
              color: index <= currentIndex
                  ? theme.colorScheme.primary
                  : AppColors.white[60]!,
              thickness: 2,
            ),
            afterLineStyle: LineStyle(
              color: index < currentIndex
                  ? theme.colorScheme.primary
                  : AppColors.white[60]!,
              thickness: 2,
            ),
            indicatorStyle: IndicatorStyle(width: 14.w, color: color),
            endChild: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
              child: Text(
                title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: color,
                  fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
