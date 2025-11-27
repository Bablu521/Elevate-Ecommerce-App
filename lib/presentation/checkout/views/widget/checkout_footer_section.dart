import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/checkout/view_models/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../view_models/checkout_events.dart';

class CheckoutFooterSection extends StatelessWidget {
  final CheckoutViewModel checkoutViewModel;

  const CheckoutFooterSection({super.key, required this.checkoutViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).subTotal,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.gray),
              ),
              Text(
                "${checkoutViewModel.state.subTotal}\$",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.gray),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).deliveryFee,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.gray),
              ),
              Text(
                "${checkoutViewModel.deliveryFee}\$",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.gray),
              ),
            ],
          ),
          const Divider(color: AppColors.gray, thickness: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).total,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "${checkoutViewModel.state.total}\$",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          SizedBox(height: 40.h),
          ElevatedButton(
            onPressed: () {
              checkoutViewModel.doIntent(CheckoutOrderEvent());
            },
            child: Text(AppLocalizations.of(context).placeOrder),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
