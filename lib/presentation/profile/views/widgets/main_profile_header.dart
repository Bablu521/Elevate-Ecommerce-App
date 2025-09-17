import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class MainProfileHeader extends StatelessWidget {
  const MainProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          ImageIcon(
            const AssetImage(AppImages.profileLogoIcon),
            size: 20,
            color: AppColors.mainColor,
          ),
          Text(
            AppLocalizations.of(context).flowery,
            style: TextStyle(
              height: 2,
              fontWeight: FontWeight.normal,
              color: AppColors.mainColor,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, RouteNames.notifications),
            child: const Icon(Icons.notifications_none, color: AppColors.gray),
          ),
        ],
      ),
    );
  }
}
