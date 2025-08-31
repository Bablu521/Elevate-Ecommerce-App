import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/cart/views/widgets/cart_billing_section.dart';
import 'package:elevate_ecommerce_app/presentation/cart/views/widgets/cart_item.dart';
import 'package:elevate_ecommerce_app/presentation/cart/views/widgets/custom_cart_address.dart';
import 'package:elevate_ecommerce_app/presentation/cart/views/widgets/custom_cart_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomCartAppBar(),
              SizedBox(height: 8.h),
              const CustomCartAddress(),
              SizedBox(height: 8.h),
              Align(
                alignment: AlignmentGeometry.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppLocalizations.of(context).clearCart,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.mainColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true, 
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const CartItem();
                },
              ),
              SizedBox(height: 20.h),
              const CartBillingSection(),
              SizedBox(height: 48.h),
              SizedBox(
                height: 48.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context).checkout),
                ),
              ),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
