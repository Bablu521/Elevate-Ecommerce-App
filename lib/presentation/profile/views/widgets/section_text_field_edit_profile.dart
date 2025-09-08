import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionTextFieldEditProfile extends StatelessWidget {
  const SectionTextFieldEditProfile({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
  });
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: firstNameController,
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
                controller: lastNameController,
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
          controller: emailController,
          style: theme.textTheme.bodyMedium,
          decoration: InputDecoration(
            label: Text(local.enterYourEmail),
            hintText: local.email,
          ),
        ),
        SizedBox(height: 24.h),
        TextFormField(
          controller: phoneController,
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
              onTap: () =>
                  Navigator.pushNamed(context, RouteNames.changePassword),
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
      ],
    );
  }
}
