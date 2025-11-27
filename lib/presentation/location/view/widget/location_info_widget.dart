import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../generated/l10n.dart';
import '../../view_model/location_events.dart';
import '../../view_model/location_view_model.dart';

class LocationInfoWidget extends StatelessWidget {
  final LocationViewModel locationViewModel;

  const LocationInfoWidget({super.key, required this.locationViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Text(
            AppLocalizations.of(context).estimatedArrival,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: AppColors.gray),
          ),
          SizedBox(height: 8.h),
          Text(
            locationViewModel.state.order?.order?.createdAt != null
                ? addTwoDaysAndFormat(
                    locationViewModel.state.order!.order!.createdAt!,
                  )
                : "03 Sep 2024, 11:00 AM",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 16.h),
          Divider(height: .5.h, color: AppColors.white[70]),
          SizedBox(height: 40.h),
          Row(
            children: [
              SvgPicture.asset(
                AppImages.deliveryBoy,
                height: 36.w,
                width: 36.w,
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    locationViewModel.state.order?.driver?.firstName ?? "",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    AppLocalizations.of(context).isYourDeliveryHeroForToday,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: AppColors.gray),
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                child: Image.asset(AppIcons.iconCall),
                onTap: () {
                  locationViewModel.doIntent(
                    LunchCallLocationEvent(
                      locationViewModel.state.order?.driver?.phone ?? "",
                    ),
                  );
                },
              ),
              SizedBox(width: 16.w),
              GestureDetector(
                child: Image.asset(AppIcons.iconWhatsapp),
                onTap: () {
                  locationViewModel.doIntent(
                    LunchWhatsAppLocationEvent(
                      locationViewModel.state.order?.driver?.phone ?? "",
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 40.h),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context).orderDetails,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  String addTwoDaysAndFormat(String dateString) {
    final DateTime dateTime = DateTime.parse(dateString);
    final DateTime newDate = dateTime.add(const Duration(days: 7));
    final DateTime localDate = newDate.toLocal();
    final String formatted = DateFormat(
      "dd MMM yyyy, hh:mm a",
    ).format(localDate);
    return formatted;
  }
}
