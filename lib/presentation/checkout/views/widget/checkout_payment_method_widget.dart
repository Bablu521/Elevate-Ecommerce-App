import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/checkout/view_models/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../view_models/checkout_events.dart';

class CheckoutPaymentMethodWidget extends StatelessWidget {
  final CheckoutViewModel checkoutViewModel;

  const CheckoutPaymentMethodWidget({super.key, required this.checkoutViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 16.h,
        children: [
          Text(
            AppLocalizations.of(context).paymentMethod,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ValueListenableBuilder(
            valueListenable: checkoutViewModel.selectedPaymentIndex,
            builder: (context, value, child) {
              return Column(
                spacing: 16.h,
                children: [
                  buildRadioListTile(
                    context: context,
                    title: AppLocalizations.of(context).cashOnDelivery,
                    index: 0,
                    value: value,
                  ),
                  buildRadioListTile(
                    context: context,
                    title: AppLocalizations.of(context).creditCard,
                    index: 1,
                    value: value,
                  ),
                ],
              );
            }
          ),
        ],
      ),
    );
  }

  Widget buildRadioListTile({
    required BuildContext context,
    required String title,
    required int index,
    required int value,
  }) {
    return Container(
      padding: EdgeInsets.only(
        top: 12.h,
        bottom: 12.h,
        left: 16.w,
        right: 10.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withValues(alpha: 0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: RadioListTile(
        value: index,
        groupValue: value,
        onChanged: (val) {
          checkoutViewModel.doIntent(ChangeSelectedPaymentEvent(index));
        },
        title: Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        dense: true,
        controlAffinity: ListTileControlAffinity.trailing,
        contentPadding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}
