import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/profile/view_model/change_password_view_model/change_password_view_model_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/change_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations().resetPassword,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: false,
      ),
      body: BlocProvider(
        create: (context) => getIt.get<ChangePasswordViewModelCubit>(),
        child: const ChangePasswordBody(),
      ),
    );
  }
}
