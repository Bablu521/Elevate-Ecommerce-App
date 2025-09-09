import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/views/widgets/occasion_view_body.dart';
import 'package:flutter/material.dart';

class OccasionView extends StatelessWidget {
  const OccasionView({super.key});

  @override
  Widget build(BuildContext context) {
    final String? occasionId =
        ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).maybePop();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).occasion,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              AppLocalizations.of(context).bloomWithOurExquisiteBestSellers,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 13,
                color: AppColors.gray,
              ),
            ),
          ],
        ),
        centerTitle: false,
      ),
      body: SafeArea(child: OccasionViewBody(occasionId: occasionId,)),
    );
  }
}
