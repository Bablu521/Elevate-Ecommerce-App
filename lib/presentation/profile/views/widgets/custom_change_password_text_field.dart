import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/change_password_view_model/change_password_view_model_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/change_password_view_model/change_password_view_model_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomChangePasswordTextField extends StatelessWidget {
  CustomChangePasswordTextField({
    super.key,
    required this.textEditingController,
    required this.label,
    required this.hintText,
    this.validator,
    required this.obscureText,
  });
  final TextEditingController textEditingController;
  final String label;
  final String hintText;
  final String? Function(String?)? validator;
  bool obscureText;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<
      ChangePasswordViewModelCubit,
      ChangePasswordViewModelState
    >(
      builder: (context, state) {
        return TextFormField(
          style: theme.textTheme.bodyMedium,
          controller: textEditingController,
          decoration: InputDecoration(
            label: Text(label),
            hintText: hintText,
            suffixIcon: GestureDetector(
              onTap: () {
                context.read<ChangePasswordViewModelCubit>().doIntent(
                  ObscureTextEven(),
                );
                obscureText = !obscureText;
              },
              child: Icon(
                obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.gray,
              ),
            ),
          ),
          validator: validator,
          obscureText: obscureText,
        );
      },
    );
  }
}
