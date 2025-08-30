import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/main_home/main_provider/controller_provider.dart';
import 'package:elevate_ecommerce_app/presentation/home_screen/view_models/home_states.dart';
import 'package:elevate_ecommerce_app/presentation/home_screen/view_models/home_view_model.dart';
import 'package:elevate_ecommerce_app/presentation/home_screen/views/widgets/category_item.dart';
import 'package:elevate_ecommerce_app/presentation/home_screen/views/widgets/occasion_item.dart';
import 'package:elevate_ecommerce_app/presentation/home_screen/views/widgets/proudect_item.dart';
import 'package:elevate_ecommerce_app/presentation/home_screen/views/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/di/di.dart';
import '../view_models/home_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ControllerProvider>(context);
    return BlocProvider(
      create: (_) => getIt<HomeViewModel>()..doIntent(OnLoadHomeListEvent()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: BlocBuilder<HomeViewModel, HomeStates>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Row(
                      children: [
                        Text(
                          AppLocalizations.of(context).flowery,
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: AppLocalizations.of(context).search,
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.gray.withAlpha(120),
                              ),
                              filled: true,
                              fillColor: AppColors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 1,
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: AppColors.gray,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Location
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.gray,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        AppLocalizations.of(context).delivertosheikhzayed,
                        style: TextStyle(color: AppColors.black),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.mainColor,
                        size: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Categories
                  SectionHeader(
                    title: AppLocalizations.of(context).categories,
                    onTap: () {
                      provider.changeSelectedCategory("");
                      provider.changePage(1);
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 95,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categoriesListSuccess.length,
                      itemBuilder: (context, index) {
                        final categories = state.categoriesListSuccess[index];
                        return CategoryItem(
                          image: categories.image ?? "",
                          label: categories.name ?? "",
                          categoryId: categories.Id ?? '',
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Best Seller
                  SectionHeader(
                    title: AppLocalizations.of(context).bestseller,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.bestSeller,
                        arguments: state.bestSellerListSuccess,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.bestSellerListSuccess.length,
                      itemBuilder: (context, index) {
                        final categories = state.bestSellerListSuccess[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.productDetails,
                              arguments: categories,
                            );
                          },
                          child: ProductItem(
                            imageUrl: categories.imgCover ?? "",
                            title: categories.title ?? "",
                            price: "${categories.price ?? ''}",
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Occasion
                  SectionHeader(
                    title: AppLocalizations.of(context).occasion,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.occasion,
                        arguments: "",
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final occasion = state.occasionListSuccess[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.occasion,
                              arguments: occasion.id,
                            );
                          },
                          child: OccasionItem(
                            imageUrl: occasion.image ?? "",
                            label: occasion.name ?? "",
                          ),
                        );
                      },
                      itemCount: state.occasionListSuccess.length,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
