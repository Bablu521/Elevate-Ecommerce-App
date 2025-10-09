import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomDriverInfo extends StatelessWidget {
  const CustomDriverInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.profileImageTest, width: 36.w, height: 36.h),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.h,
              children: [
                Text("Mona Mohamed", style: theme.textTheme.headlineSmall),
                Text(
                  local.isYourDeliveryHeroForToday,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.gray,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 25.w),
          Icon(Icons.local_phone_outlined, color: theme.colorScheme.primary),
          SizedBox(width: 16.w),
          SvgPicture.asset(AppImages.whatsAppIcon),
        ],
      ),
    );
  }
}
