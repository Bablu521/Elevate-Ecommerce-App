import 'package:elevate_ecommerce_app/core/utils/validations.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/view_models/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatelessWidget {
  final RegisterViewModel registerViewModel;
  const RegisterForm({super.key , required this.registerViewModel});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerViewModel.formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: registerViewModel.firstNameController,
                  style: Theme.of(context).textTheme.bodySmall,
                  validator: Validations.validateFullName,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).firstName,
                    hintText: AppLocalizations.of(context).enterFirstName,
                  ),
                ),
              ),
              SizedBox(width: 17.w),
              Expanded(
                child: TextFormField(
                  controller: registerViewModel.lastNameController,
                  style: Theme.of(context).textTheme.bodySmall,
                  validator: Validations.validateFullName,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).lastName,
                    hintText: AppLocalizations.of(context).enterLastName,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          TextFormField(
            controller: registerViewModel.emailController,
            style: Theme.of(context).textTheme.bodySmall,
            validator: Validations.validateEmail,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).email,
              hintText: AppLocalizations.of(context).enterYourEmail,
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  obscureText: true,
                  controller: registerViewModel.passwordController,
                  style: Theme.of(context).textTheme.bodySmall,
                  validator: Validations.validatePassword,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).password,
                    hintText: AppLocalizations.of(context).enterPassword,
                  ),
                ),
              ),
              SizedBox(width: 17.w),
              Expanded(
                child: TextFormField(
                  obscureText: true,
                  controller: registerViewModel.confirmPasswordController,
                  style: Theme.of(context).textTheme.bodySmall,
                  validator: (val) {
                    return Validations.validateConfirmPassword(
                      val,
                      registerViewModel.passwordController.text,
                    );
                  },
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).confirmPassword,
                    hintText: AppLocalizations.of(context).confirmPassword,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          TextFormField(
            keyboardType: TextInputType.phone,
            controller: registerViewModel.phoneNumberController,
            style: Theme.of(context).textTheme.bodySmall,
            validator: Validations.validatePhoneNumber,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).phoneNumber,
              hintText: AppLocalizations.of(context).enterPhoneNumber,
            ),
          ),
        ],
      ),
    );
  }
}
