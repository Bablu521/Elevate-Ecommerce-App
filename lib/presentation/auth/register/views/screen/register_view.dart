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
    return BlocListener<RegisterViewModel, RegisterStates>(
      bloc: registerViewModel,
      listener: (context, state) {
        if (state.errorMessage != null) {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return AlertDialog(
                title: Text(AppLocalizations.of(context).error),
                content: Text(state.errorMessage!),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: Text(AppLocalizations.of(context).close),
                  ),
                ],
              );
            },
          );
        } else if (state.data != null) {
          Navigator.of(context).pop();
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return AlertDialog(
                title: Text(AppLocalizations.of(context).welcome),
                content: Text(
                  AppLocalizations.of(context).registeredSuccessfully,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(RouteNames.login);
                    },
                    child: Text(AppLocalizations.of(context).close),
                  ),
                ],
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (_) {
              return Center(child: CircularProgressIndicator());
            },
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: Navigator.of(context).maybePop,
            child: Icon(Icons.arrow_back_ios),
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
