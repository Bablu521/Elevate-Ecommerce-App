import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SectionProductItemInfo extends StatelessWidget {
  const SectionProductItemInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "EGP 1,500",
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    local.allPriceIncludeTax,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.gray,
                    ),
                  ),

                  Text(
                    "15 Pink Rose Bouquet",
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
              Text("${local.status} : In stock"),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            local.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.secondary,
            ),
          ),
          Text(
            "Lorem ipsum dolor sit amet consectetur. Id sit morbi ornare morbi duis rhoncus orci massa.",
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 24),
          Text(
            local.bouquetInclude,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Pink roses:15",
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.secondary,
            ),
          ),
          Text(
            "White wrap",
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
