import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEditImageProfile extends StatelessWidget {
  const CustomEditImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return Container(
      width: mediaQuery.width * 0.23.w,
      height: mediaQuery.width * 0.23.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(AppImages.profileImageTest),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: AppColors.lightPink,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.camera_alt_outlined,
              color: AppColors.gray,
              size: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
