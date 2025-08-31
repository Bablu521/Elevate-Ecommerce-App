import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartBillingSection extends StatelessWidget {
  const CartBillingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context).subTotal,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.gray,
                          fontFamily: ConstKeys.robotoFont,
                        ),
                      ),
                      Text(
                        "100\$",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.gray,
                          fontFamily: ConstKeys.robotoFont,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context).deliveryFee,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.gray,
                          fontFamily: ConstKeys.robotoFont,
                        ),
                      ),
                      Text(
                        "10\$",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.gray,
                          fontFamily: ConstKeys.robotoFont,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  const Divider(thickness: 0.5, color: AppColors.gray),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context).total,
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(fontFamily: ConstKeys.robotoFont),
                      ),
                      Text(
                        "110\$",
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(fontFamily: ConstKeys.robotoFont),
                      ),
                    ],
                  ),
                ],
              );
  }
}