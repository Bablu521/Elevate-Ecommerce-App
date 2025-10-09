import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/track_order/view/widgets/custom_driver_info.dart';
import 'package:elevate_ecommerce_app/presentation/track_order/view/widgets/custom_time_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackOrderBody extends StatelessWidget {
  const TrackOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(16.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Column(
                  spacing: 8.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      local.estimatedArrival,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: AppColors.gray,
                      ),
                    ),
                    Text(
                      "03 Sep 2024, 11:00 AM",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Divider(color: AppColors.white[70]),
          SizedBox(height: 40.h),
          const CustomDriverInfo(),
          SizedBox(height: 40.h),
          Center(
            child: Image.asset(
              AppImages.carTestImage,
              width: 213.w,
              height: 83.h,
            ),
          ),
          SizedBox(height: 40.h),
          const CustomTimeLine(),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                local.showMap,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.onSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
