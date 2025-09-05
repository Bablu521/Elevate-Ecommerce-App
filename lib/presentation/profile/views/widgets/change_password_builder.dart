import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/change_password_request/change_password_request.dart';
import 'package:elevate_ecommerce_app/core/utils/validations.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/profile/view_model/change_password_view_model/change_password_view_model_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/profile/view_model/change_password_view_model/change_password_view_model_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordBuilder extends StatelessWidget {
  const ChangePasswordBuilder({
    super.key,
    required this.globalKey,
    required this.confirmPasswordController,
    required this.currentPasswordController,
    required this.newPasswordController,
  });
  final TextEditingController currentPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> globalKey;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return Form(
      key: globalKey,
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
              validator: (value) => Validations.validateConfirmPassword(
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
                    onPressed: (allFilled)
                        ? () {
                            if (globalKey.currentState!.validate()) {
                              context
                                  .read<ChangePasswordViewModelCubit>()
                                  .doIntent(
                                    ChangePasswordEvent(
                                      changePasswordRequest:
                                          ChangePasswordRequest(
                                            password:
                                                currentPasswordController.text,
                                            newPassword:
                                                confirmPasswordController.text,
                                          ),
                                    ),
                                  );
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
