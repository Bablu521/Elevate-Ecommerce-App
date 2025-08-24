import 'package:elevate_ecommerce_app/core/custom_widget/custom_dialog.dart';
import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/view_models/register_states.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/view_models/register_view_model.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final RegisterViewModel registerViewModel = getIt.get<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: registerViewModel,
      listener: (context, state) {
        if (state.errorMessage != null) {
          Navigator.of(context).pop();
          CustomDialog.positiveButton(
            context: context,
            title: local.error,
            message: state.errorMessage,
          );
        } else if (state.data != null) {
          Navigator.of(context).pop();
          CustomDialog.positiveButton(context: context, title: local.success );
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.pushReplacementNamed(context, RouteNames.login);
          });
        } else {
          CustomDialog.loading(context: context, message: local.loading);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap:
                () => Navigator.of(
                  context,
                ).pushReplacementNamed(RouteNames.login),

            child: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(AppLocalizations().signUp),
        ),
        body: SafeArea(
          child: RegisterViewBody(registerViewModel: registerViewModel),
        ),
      ),
    );
  }
}
