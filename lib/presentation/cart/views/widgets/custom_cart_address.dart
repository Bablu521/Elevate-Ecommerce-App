import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCartAddress extends StatelessWidget {
  const CustomCartAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24.w,
          height: 24.h,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(AppImages.locationIconImage)),
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          AppLocalizations.of(context).deliverTo,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.gray,
            fontWeight: FontWeight.w500,
            fontFamily: ConstKeys.robotoFont,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          AppLocalizations.of(context).fakeAddress,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
            fontFamily: ConstKeys.robotoFont,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 8.w),
        const Icon(
          Icons.keyboard_arrow_down_outlined,
          size: 28,
          color: AppColors.gray,
        ),
      ],
    );
  }
}