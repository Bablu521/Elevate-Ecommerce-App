import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/core/utils/widgets/custom_cached_network_image.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/track_order/view/widgets/custom_driver_info.dart';
import 'package:elevate_ecommerce_app/presentation/track_order/view/widgets/custom_time_line.dart';
import 'package:elevate_ecommerce_app/presentation/track_order/view_model/track_order_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TrackOrderBody extends StatelessWidget {
  const TrackOrderBody({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return BlocBuilder<TrackOrderViewModelCubit, TrackOrderViewModelState>(
      buildWhen: (prev, curr) =>
          prev.orderFromFireBase != curr.orderFromFireBase,
      builder: (context, state) {
        if (state.orderFromFireBase?.isLoading == true) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.orderFromFireBase?.errorMessage != null) {
          return Center(child: Text(state.orderFromFireBase!.errorMessage!));
        }
        return Padding(
          padding: EdgeInsets.all(16.sp),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Flexible(
                    child: Column(
                      spacing: 8.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          local.estimatedArrival,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.gray,
                          ),
                        ),
                        Text(
                          DateFormat('EEEE, d MMM yyyy , hh:mm a').format(
                            DateTime.parse(
                              state.orderFromFireBase?.data?.order?.createdAt ??
                                  "",
                            ),
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Divider(color: AppColors.white[70]),
                SizedBox(height: 40.h),
                CustomDriverInfo(
                  driverEntity: state.orderFromFireBase?.data?.driver,
                ),
                SizedBox(height: 40.h),
                Center(
                  child: CustomCachedNetworkImage(
                    imageUrl:
                        state.orderFromFireBase?.data?.driver?.vehicleLicense ??
                        "",
                    width: 213.w,
                    height: 83.h,
                  ),
                ),
                SizedBox(height: 40.h),
                const CustomTimeLine(),
                SizedBox(height: 40.h),

                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () async {},
                    child: Text(
                      local.showMap,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: theme.colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
