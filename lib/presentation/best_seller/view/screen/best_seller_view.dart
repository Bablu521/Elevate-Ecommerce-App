import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/best_seller/view/widgets/best_seller_body.dart';
import 'package:elevate_ecommerce_app/presentation/best_seller/view_model/best_seller_event.dart';
import 'package:elevate_ecommerce_app/presentation/best_seller/view_model/best_seller_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerView extends StatelessWidget {
  const BestSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              local.bestSeller,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              local.bloomWithOurExquisiteBestSellers,
              style: theme.textTheme.labelSmall!.copyWith(
                color: AppColors.gray,
              ),
            ),
          ],
        ),
        centerTitle: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            getIt.get<BestSellerViewModelCubit>()
              ..doIntent(GetBestSellerEvent()),
        child: const BestSellerBody(),
      ),
    );
  }
}
