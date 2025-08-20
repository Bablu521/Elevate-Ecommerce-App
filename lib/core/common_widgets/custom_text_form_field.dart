import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.onChanged,
    this.onSaved,
    this.maxLines = 1,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.obscuringCharacter = "*",
    this.validator,
    this.textInputAction,
    this.hintStyle,
    this.contentPadding,
    this.style,
    this.onTap,
    this.enabled,
    this.suffixIconConstraints,
    this.maxLength,
    this.prefixIcon,
    this.prefixIconConstraints,
    required this.label,
    this.labelStyle,
  });
  final String? hintText;
  final String label;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final String obscuringCharacter;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final void Function()? onTap;
  final bool? enabled;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      style:
          style ??
          Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          ),

      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        contentPadding: contentPadding ?? REdgeInsets.all(16),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
        label: Text(
          label,
          style:
              labelStyle ??
              Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
        ),
        hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyMedium,
        hintText: hintText,
        focusedBorder: buildOutlinedBorder(
          borderColor: Theme.of(context).colorScheme.primary,
        ),
        enabledBorder: buildOutlinedBorder(
          borderColor: Theme.of(context).colorScheme.shadow,
        ),
        focusedErrorBorder: buildOutlinedBorder(
          borderColor: Theme.of(context).colorScheme.primary,
        ),
        errorBorder: buildOutlinedBorder(
          borderColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        disabledBorder: buildOutlinedBorder(
          borderColor: Theme.of(context).colorScheme.secondary,
        ),
        prefixIcon: prefixIcon,
        prefixIconConstraints:
            prefixIconConstraints ??
            BoxConstraints(maxWidth: 60.r, maxHeight: 60.r),
        suffixIconConstraints:
            suffixIconConstraints ??
            BoxConstraints(maxWidth: 60.r, maxHeight: 60.r),
        suffixIcon: suffixIcon,
        errorStyle: Theme.of(context).textTheme.labelSmall,
      ),
      maxLength: maxLength,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      validator: validator,
      enabled: enabled,
    );
  }

  OutlineInputBorder buildOutlinedBorder({required Color borderColor}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide(color: borderColor),
    );
  }
}
