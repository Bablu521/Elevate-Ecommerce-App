import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/core/custom_widget/custom_dialog.dart';
import 'package:elevate_ecommerce_app/domin/entities/profile_info_entity.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/main_profile_view_model/main_profile_event.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/main_profile_view_model/main_profile_view_model.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/custom_main_profile_image.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/custom_profile_item.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/main_profile_header.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/section_app_config_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MainProfileBody extends StatelessWidget {
  const MainProfileBody({super.key, required this.profileInfoEntity});
  final ProfileInfoEntity profileInfoEntity;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const MainProfileHeader(),
            const SizedBox(height: 16),
            CustomMainProfileImage(image: profileInfoEntity.imagePath),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  profileInfoEntity.firstName,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to editProfilePage
                  },
                  child: Image.asset(AppImages.penImage),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              profileInfoEntity.email,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: AppColors.gray,
              ),
            ),
            SizedBox(height: 32.h),
            CustomProfileItem(
              firstWidget: ImageIcon(
                const AssetImage(AppImages.transactionOrder),
                color: AppColors.black,
              ),
              text: local.myOrders,
              secondWidget: const Icon(Icons.arrow_forward_ios_outlined),
            ),
            CustomProfileItem(
              firstWidget: Icon(
                Icons.location_on_outlined,
                color: AppColors.black,
              ),
              text: local.savedAddress,
              secondWidget: const Icon(Icons.arrow_forward_ios_outlined),
            ),
            Divider(color: AppColors.gray, height: 0.h, thickness: 0.8),
            const SectionAppConfigProfile(),
            Divider(color: AppColors.gray, height: 0.h, thickness: 0.8),
            CustomProfileItem(
              firstWidget: Icon(
                Icons.logout,
                size: 18.sp,
                color: AppColors.gray,
              ),
              secondWidget: const Icon(Icons.logout, color: AppColors.gray),
              text: local.logout,
              onTap: () {
                CustomDialog.positiveAndNegativeButton(
                  context: context,
                  message: local.DoYouSureLogout,
                  negativeText: local.no,
                  title: local.logout,
                  cancelable: true,
                  positiveOnClick: () => context
                      .read<MainProfileViewModel>()
                      .doIntent(ProfileLogoutEvent()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
