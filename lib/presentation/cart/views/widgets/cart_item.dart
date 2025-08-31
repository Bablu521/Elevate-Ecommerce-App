import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 117.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          border: Border.all(color: AppColors.gray, width: 0.5.w),
        ),
        child: Row(
          children: [
            Container(
              width: 96.w,
              height: 101.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                color: AppColors.lightPink,
                image: const DecorationImage(
                  image: AssetImage("assets/images/cartTestImage.png"),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context).redRoses,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              AppLocalizations.of(context).pinkRoseBouquet,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall!.copyWith(
                                fontSize: 13.sp,
                                color: AppColors.gray,
                                overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 16.w,
                            height: 18.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImages.deleteIconImage),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "${AppLocalizations.of(context).eGP} 600",
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(Icons.remove),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "1",
                                  style: Theme.of(context).textTheme.bodySmall!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(width: 8.w),
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
