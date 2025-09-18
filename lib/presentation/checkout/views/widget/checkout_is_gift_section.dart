import 'package:elevate_ecommerce_app/presentation/checkout/view_models/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/validations.dart';
import '../../../../generated/l10n.dart';

class CheckoutIsGiftSection extends StatelessWidget {
  final CheckoutViewModel checkoutViewModel;

  const CheckoutIsGiftSection({super.key, required this.checkoutViewModel});

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
            AppLocalizations.of(context).itIsAGift,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextFormField(
            controller: checkoutViewModel.nameController,
            style: Theme.of(context).textTheme.bodySmall,
            validator: Validations.validateFullName,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).name,
              hintText: AppLocalizations.of(context).enterTheName,
            ),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          TextFormField(
            controller: checkoutViewModel.phoneController,
            style: Theme.of(context).textTheme.bodySmall,
            validator: Validations.validatePhoneNumber,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).phoneNumber,
              hintText: AppLocalizations.of(context).enterPhoneNumber,
            ),
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
