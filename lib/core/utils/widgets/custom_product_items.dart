import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomProductItems extends StatelessWidget {
  const CustomProductItems({super.key});
  // childAspectRatio: 165 / 255, in gridView
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.white[70]!, width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 147 / 131,
              child: Image.asset("assets/images/kTestFlower.png"),
            ),
            SizedBox(height: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Red roses"),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EGP 600",
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                        Text(
                          "800",
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.gray,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.gray,
                          ),
                        ),
                        Text(
                          "20%",
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined, size: 16),
              label: Text(
                local.addToCart,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 36),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
