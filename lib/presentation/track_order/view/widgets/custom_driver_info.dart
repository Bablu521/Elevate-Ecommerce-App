import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/core/utils/widgets/custom_cached_network_image.dart';
import 'package:elevate_ecommerce_app/domin/entities/firestore/driver_entity.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/track_order/view_model/track_order_view_model_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/track_order/view_model/track_order_view_model_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CustomDriverInfo extends StatelessWidget {
  const CustomDriverInfo({super.key, required this.driverEntity});
  final DriverEntity? driverEntity;
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final cubit = context.read<TrackOrderViewModelCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppImages.deliveryBoy,
            height: 36.w,
            width: 36.w,
          ),

          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4.h,
              children: [
                Text(
                  driverEntity?.firstName ?? "",
                  style: theme.textTheme.headlineSmall,
                ),
                Text(
                  local.isYourDeliveryHeroForToday,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.gray,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 25.w),
          GestureDetector(
            onTap: () => cubit.doIntent(
              TrackOrderViewModelDirectCall(
                phoneNumber: driverEntity?.phone ?? "",
              ),
            ),
            child: Icon(
              Icons.local_phone_outlined,
              color: theme.colorScheme.primary,
            ),
          ),
          SizedBox(width: 16.w),
          GestureDetector(
            onTap: () => cubit.doIntent(
              TrackOrderViewModelDirectToWhatsApp(
                phoneNumber: driverEntity?.phone ?? "",
              ),
            ),
            child: SvgPicture.asset(AppImages.whatsAppIcon),
          ),
        ],
      ),
    );
  }
}
