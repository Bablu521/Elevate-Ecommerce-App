import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/view_models/register_events.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/view_models/register_view_model.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/views/widgets/gender_radio_list_tile.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/views/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterViewBody extends StatelessWidget {
  final RegisterViewModel registerViewModel;
  const RegisterViewBody({super.key, required this.registerViewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24.h),
            RegisterForm(registerViewModel: registerViewModel),
            SizedBox(height: 24.h),
            GenderRadioListTile(registerViewModel: registerViewModel),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  AppLocalizations.of(context).creatingAnAccountYouAgreeToOur,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall!.copyWith(fontSize: 12),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    AppLocalizations.of(context).termsAndConditions,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 48.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: () {
                  if (registerViewModel.formKey.currentState!
                      .validate()) {
                    registerViewModel.doIntent(OnSignUpClickEvent());
                  }
                },
                child: Text(AppLocalizations.of(context).signUp),
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context).alreadyHaveAnAccount,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteNames.login);
                    },
                    child: Text(
                      AppLocalizations.of(context).login,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.mainColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
