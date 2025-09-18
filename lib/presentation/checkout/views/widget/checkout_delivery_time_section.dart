import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class CheckoutDeliveryTimeSection extends StatelessWidget {
  const CheckoutDeliveryTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        spacing: 16.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).deliveryTime,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                AppLocalizations.of(context).schedule,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.mainColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            spacing: 3.w,
            children: [
              Icon(
                Icons.access_time_outlined,
                size: 20,
                color: AppColors.black,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: AppLocalizations.of(context).instant,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: AppLocalizations.of(context).arriveBy,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}