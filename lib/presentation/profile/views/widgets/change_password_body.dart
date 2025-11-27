import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/core/utils/helper_function.dart';
import 'package:elevate_ecommerce_app/core/utils/loaders/loaders.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/change_password_view_model/change_password_view_model_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/change_password_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocListener<
      ChangePasswordViewModelCubit,
      ChangePasswordViewModelState
    >(
      listener: (context, state) async {
        if (state.isLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state.changePasswordEntity != null) {
          HelperFunction.dismissDialog(context);
          Loaders.showSuccessMessage(
            message: state.changePasswordEntity?.message ?? "",
            context: context,
          );
          _clearControllers();

        
Future.delayed(const Duration(seconds: 1), () {
            if (!mounted) return;
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.login,
              (route) => false,
            );
          });
        } else if (state.errorMessage != null) {
          HelperFunction.dismissDialog(context);
          Loaders.showErrorMessage(
            message: state.errorMessage ?? "",
            context: context,
          );
        } else {}
      },
      child: ChangePasswordBuilder(
        confirmPasswordController: confirmPasswordController,
        currentPasswordController: currentPasswordController,
        newPasswordController: newPasswordController,
        globalKey: _globalKey,
      ),
    );
  }

  void _clearControllers() {
    confirmPasswordController.clear();
    currentPasswordController.clear();
    newPasswordController.clear();
  }

  @override
  void dispose() {
    confirmPasswordController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }
}
