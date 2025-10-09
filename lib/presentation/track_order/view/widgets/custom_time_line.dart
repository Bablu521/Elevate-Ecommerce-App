import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimeLine extends StatelessWidget {
  const CustomTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    // final local = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final steps = [
      {
        "title": "Received your order",
        "date": "03 Sep 2024 - 2:10",
        "isDone": true,
      },
      {
        "title": "Preparing your order",
        "date": "03 Sep 2024 - 2:10",
        "isDone": true,
      },
      {
        "title": "Out for delivery",
        "date": "03 Sep 2024 - 2:10",
        "isDone": false,
      },
      {"title": "Delivered", "date": "03 Sep 2024 - 2:10", "isDone": false},
    ];
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: steps.length,
          itemBuilder: (context, index) {
            final item = steps[index];
            final isFirst = index == 0;
            final isLast = index == steps.length - 1;
            final isDone = item["isDone"] as bool;
            return TimelineTile(
              alignment: TimelineAlign.start,
              isFirst: isFirst,
              isLast: isLast,
              lineXY: 0.1,
              beforeLineStyle: LineStyle(
                color: isDone ? Colors.pink : Colors.grey.shade300,
                thickness: 2,
              ),
              afterLineStyle: LineStyle(
                color:
                    (index + 1 < steps.length &&
                        steps[index + 1]["isDone"] == true)
                    ? Colors.pink
                    : Colors.grey.shade300,
                thickness: 2,
              ),
              indicatorStyle: IndicatorStyle(
                width: 14.w,
                color: isDone ? Colors.pink : Colors.grey,
              ),
              endChild: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["title"] as String,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item["date"] as String,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
