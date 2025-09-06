import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/core/provider/app_config_provider.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/core/utils/widgets/user_guest_mode_page.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/profile_event.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/profile_states.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/profile_view_model.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/custom_button_sheet.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/edit_profile_page.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/profile_roe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import '../../../core/di/di.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isToggled = true;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppConfigProvider>(context);
    return BlocProvider(
      create: (_) => getIt<ProfileViewModel>()..doIntent(OnLoadProfileEvent()),

      child: BlocBuilder<ProfileViewModel, ProfileStates>(
        builder: (context, state) {
          if (state.isLogged == false) {
            return const UserGuestModePage();
          } else if (state.profileListIsLoading == true) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.profileListErrorMessage != null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    state.profileListErrorMessage!,
                    style: const TextStyle(color: AppColors.red),
                  ),
                ],
              ),
            );
          } else if (state.editProfile == true) {
            return const EditProfilePage();
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ImageIcon(
                              const AssetImage("assets/icons/Vector.png"),
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
                            const Icon(
                              Icons.notifications_none,
                              color: AppColors.gray,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.22,
                              height: MediaQuery.of(context).size.width * 0.22,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "${state.profileListSuccess?.user?.photo}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${state.profileListSuccess?.user?.firstName}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Inter",
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteNames.editProfile,
                                );
                              },
                              child: Image.asset(AppImages.penImage),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${state.profileListSuccess?.user?.email}",
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontFamily: "Inter",
                                color: AppColors.gray,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),

                        ProfileRow(
                          icon1: ImageIcon(
                            const AssetImage(
                              "assets/icons/Transaction-order (交易清单).png",
                            ),
                            color: AppColors.black,
                          ),
                          text: AppLocalizations.of(context).myOrders,
                          icon2: const Icon(Icons.arrow_forward_ios_outlined),
                        ),
                        const SizedBox(height: 16),
                        ProfileRow(
                          icon1: Icon(
                            Icons.location_on_outlined,
                            color: AppColors.black,
                          ),
                          text: AppLocalizations.of(context).savedAddress,
                          icon2: const Icon(Icons.arrow_forward_ios_outlined),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: AppColors.gray,
                        height: 0.8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            FlutterSwitch(
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
                            const SizedBox(width: 16),

                            Text(
                              AppLocalizations.of(context).notifications,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: AppColors.black,
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios_outlined),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: AppColors.gray,
                        height: 0.8,
                      ),
                      const SizedBox(height: 16),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ImageIcon(
                                      const AssetImage(
                                        "assets/icons/ax_vector.png",
                                      ),
                                      size: 20,
                                      color: AppColors.black,
                                    ),
                                    Text(
                                      AppLocalizations.of(context).language,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (context) =>
                                              const CustomButtonSheet(),
                                        );
                                      },
                                      child: Text(
                                        provider.local ==
                                                ConstKeys.kEnglishLanguage
                                            ? AppLocalizations.of(
                                                context,
                                              ).english
                                            : AppLocalizations.of(
                                                context,
                                              ).arabic,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: AppColors.mainColor,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context).aboutUs,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Text(
                                      AppLocalizations.of(
                                        context,
                                      ).termsAndConditions,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.arrow_forward_ios_outlined,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            color: AppColors.gray,
                            height: 0.8,
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ProfileRow(
                              icon1: const Icon(Icons.logout, size: 18),
                              icon2: const Icon(Icons.logout, size: 28),
                              text: AppLocalizations.of(context).logout,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
