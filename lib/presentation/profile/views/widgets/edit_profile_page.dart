import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/custom_edit_image_profile.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/custom_profile_radio.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/edit_profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            const EditProfileHeader(),
            SizedBox(height: 20.h),
            const CustomEditImageProfile(),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: theme.textTheme.bodyMedium,
                    decoration: InputDecoration(
                      label: Text(local.firstName),
                      hintText: local.enterFirstName,
                    ),
                  ),
                ),
                SizedBox(width: 17.w),
                Expanded(
                  child: TextFormField(
                    style: theme.textTheme.bodyMedium,
                    decoration: InputDecoration(
                      label: Text(local.enterLastName),
                      hintText: local.lastName,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            TextFormField(
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                label: Text(local.enterYourEmail),
                hintText: local.email,
              ),
            ),
            SizedBox(height: 24.h),
            TextFormField(
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                label: Text(local.enterPhoneNumber),
                hintText: local.phoneNumber,
              ),
            ),
            SizedBox(height: 24.h),
            TextFormField(
              controller: TextEditingController(text: "★★★★★★"),
              readOnly: true,
              decoration: InputDecoration(
                hintText: local.password,
                suffix: GestureDetector(
                  onTap:
                      () => Navigator.pushNamed(
                        context,
                        RouteNames.changePassword,
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      local.change,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            const CustomProfileRadio(),
            SizedBox(height: 48.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  local.update,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSecondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
