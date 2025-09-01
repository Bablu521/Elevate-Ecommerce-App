import 'dart:developer';
import 'package:elevate_ecommerce_app/core/utils/validations.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordBody extends StatefulWidget {
  const ChangePasswordBody({super.key});

  @override
  State<ChangePasswordBody> createState() => _ChangePasswordBodyState();
}

class _ChangePasswordBodyState extends State<ChangePasswordBody> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return Form(
      key: _globalKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            TextFormField(
              style: theme.textTheme.bodyMedium,
              controller: currentPasswordController,
              decoration: InputDecoration(
                label: Text(local.currentPassword),
                hintText: local.currentPassword,
              ),
              validator: Validations.validatePassword,
            ),
            SizedBox(height: 24.h),
            TextFormField(
              style: theme.textTheme.bodyMedium,
              controller: newPasswordController,
              decoration: InputDecoration(
                label: Text(local.newPassword),
                hintText: local.newPassword,
              ),
              validator: Validations.validatePassword,
            ),
            SizedBox(height: 24.h),
            TextFormField(
              style: theme.textTheme.bodyMedium,
              controller: confirmPasswordController,
              decoration: InputDecoration(
                label: Text(local.confirmPassword),
                hintText: local.confirmPassword,
              ),
              validator:
                  (value) => Validations.validateConfirmPassword(
                    value,
                    newPasswordController.text,
                  ),
            ),
            SizedBox(height: 48.h),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: confirmPasswordController,
              builder: (context, value, child) {
                final bool allFilled =
                    currentPasswordController.text.isNotEmpty &&
                    newPasswordController.text.isNotEmpty &&
                    confirmPasswordController.text.isNotEmpty;
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        (allFilled)
                            ? () {
                              if (_globalKey.currentState!.validate()) {
                                log("sucs");
                                setState(() {});
                              }
                            }
                            : null,
                    child: Text(
                      local.update,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSecondary,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
