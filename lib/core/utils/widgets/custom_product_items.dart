import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductItems extends StatelessWidget {
  final String title;
  final String imgCover;
  final num priceAfterDiscount;
  final num price;

  const CustomProductItems({
    super.key,
    required this.title,
    required this.imgCover,
    required this.priceAfterDiscount,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.white[70]!, width: 0.5.w),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imgCover,
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 6,
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(fontSize: 12.sp),
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Wrap(
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            "EGP ${priceAfterDiscount.toString()}",
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            price.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColors.gray,
                            ),
                          ),
                          Text(
                            "${((price - priceAfterDiscount) / price * 100).toInt()}%",
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              height: 30.h,
              width: 147.w,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined, size: 18),
                label: Text(
                  local.addToCart,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
