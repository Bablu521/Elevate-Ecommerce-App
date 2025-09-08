import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/domin/entities/address_entity.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_events.dart';
import 'package:elevate_ecommerce_app/presentation/address/view_models/address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedAddressListViewItem extends StatelessWidget {
  final AddressEntity address;
  final AddressViewModel addressViewModel;
  const SavedAddressListViewItem({
    super.key,
    required this.address,
    required this.addressViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        height: 85.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.gray.withValues(alpha: 0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 14.w,
                            height: 17.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImages.locationIconImage),
                              ),
                            ),
                          ),
                          SizedBox(width: 7.w),
                          Text(
                            address.city ?? AppLocalizations.of(context).city,
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Column(
                    children: [
                      Text(
                        address.street ?? AppLocalizations.of(context).street,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontFamily: ConstKeys.robotoFont,
                          fontSize: 13,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      addressViewModel.doIntent(
                        OnRemoveAddressEvent(addressId: address.id??""),
                      );
                    },
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
                  SizedBox(width: 7.w),
                  InkWell(
                    onTap: () {
                      //edit address
                    },
                    child: Container(
                      width: 18.w,
                      height: 18.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.editIconImage),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
