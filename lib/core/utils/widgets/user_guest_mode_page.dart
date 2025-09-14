import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserGuestModePage extends StatelessWidget {
  const UserGuestModePage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuerySize = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: mediaQuerySize.height * 0.15.h,
              child: Image.asset(AppImages.lockAccessImage),
            ),
            SizedBox(height: 16.h, width: double.infinity),
            Text(
              local.guestMode,
              style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.gray),
            ),
            SizedBox(height: 16.h),
            Text(
              local.loginToSaveCartAndManageProfile,
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: mediaQuerySize.width * 0.4.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RouteNames.login);
                },
                child: Text(local.login),
              ),
            ),
            Text(local.or, style: theme.textTheme.bodySmall),
            SizedBox(
              width: mediaQuerySize.width * 0.4.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RouteNames.register);
                },
                child: Text(local.signUp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
