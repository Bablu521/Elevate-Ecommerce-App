import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/presentation/checkout/view_models/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../view_models/checkout_events.dart';

class CheckoutDeliveryAddressSection extends StatelessWidget {
  final CheckoutViewModel checkoutViewModel;

  const CheckoutDeliveryAddressSection({super.key, required this.checkoutViewModel});

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
            AppLocalizations.of(context).deliveryAddress,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          ValueListenableBuilder(
            valueListenable: checkoutViewModel.selectedAddressIndex,
            builder: (context, value, child) {
              if (checkoutViewModel.state.addressesList != null &&
                  checkoutViewModel.state.addressesList!.isNotEmpty) {
                return ListView.separated(
                  itemCount: checkoutViewModel.state.addressesList!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return buildAddressItem(
                      context: context,
                      city: checkoutViewModel.state.addressesList![index].city!,
                      street:
                          checkoutViewModel.state.addressesList![index].street!,
                      index: index,
                      value: value,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 16.h);
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pushNamed(RouteNames.addAddress);
            },
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: WidgetStateProperty.all(AppColors.white),
              side: WidgetStateProperty.all(
                BorderSide(color: AppColors.white[70]!, width: 1.w),
              ),
            ),
            label: Text(
              AppLocalizations.of(context).addNew,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.mainColor,
              ),
            ),
            icon: Icon(Icons.add, color: AppColors.mainColor),
          ),
        ],
      ),
    );
  }

  Widget buildAddressItem({
    required BuildContext context,
    required String city,
    required String street,
    required int index,
    required int value,
  }) {
    return GestureDetector(
      onTap: () {
        checkoutViewModel.doIntent(ChangeSelectedAddressEvent(index));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    children: [
                      Radio(
                        value: index,
                        groupValue: value,
                        onChanged: (val) {
                          checkoutViewModel.doIntent(
                            ChangeSelectedAddressEvent(val!),
                          );
                        },
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      Text(
                        city,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    street,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: AppColors.gray),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              bottom: 0,
              right: 16.w,
              child: InkWell(
                child: Icon(
                  Icons.edit_outlined,
                  color: AppColors.gray,
                  size: 20.w,
                ),
                onTap: () {
                  /*Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddAddressView(
                        addressEntity:
                            checkoutViewModel.state.addressesList![index],
                      )
                    )
                  );*/
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
