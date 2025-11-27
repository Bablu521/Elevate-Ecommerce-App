import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/core/provider/app_config_provider.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/custom_button_sheet.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/custom_profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SectionAppConfigProfile extends StatefulWidget {
  const SectionAppConfigProfile({super.key});

  @override
  State<SectionAppConfigProfile> createState() =>
      _SectionAppConfigProfileState();
}

class _SectionAppConfigProfileState extends State<SectionAppConfigProfile> {
  bool isToggled = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    final provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        CustomProfileItem(
          firstWidget: FlutterSwitch(
            width: 42.0,
            height: 20.0,
            valueFontSize: 25.0,
            toggleSize: 18.0,
            value: isToggled,
            borderRadius: 15.0,
            padding: 2.0,
            showOnOff: false,
            activeColor: AppColors.mainColor,
            inactiveColor: AppColors.gray,
            onToggle: (val) {
              setState(() {
                isToggled = val;
              });
            },
          ),
          text: local.notifications,
          onTap: () => Navigator.pushNamed(context, RouteNames.notifications),
        ),
        Divider(color: AppColors.gray, height: 0.h, thickness: 0.8),
        CustomProfileItem(
          firstWidget: ImageIcon(
            const AssetImage(AppImages.languageIcon),
            size: 20,
            color: AppColors.black,
          ),
          text: local.language,
          secondWidget: Text(
            provider.local != null
                ? provider.local == ConstKeys.kEnglishLanguage
                      ? local.english
                      : local.arabic
                : local.english,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.mainColor,
            ),
          ),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const CustomButtonSheet(),
            );
          },
          verticalPadding: 8,
        ),
        CustomProfileItem(
          firstWidget: Text(
            local.aboutUs,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          verticalPadding: 8,
        ),
        CustomProfileItem(
          firstWidget: Text(
            local.termsAndConditions,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          verticalPadding: 8,
        ),
      ],
    );
  }
}
