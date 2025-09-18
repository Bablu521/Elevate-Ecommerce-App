import 'package:elevate_ecommerce_app/api/mapper/home/best_seller_mapper.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/home/view_models/home_states.dart';
import 'package:elevate_ecommerce_app/presentation/home/view_models/home_view_model.dart';
import 'package:elevate_ecommerce_app/presentation/home/views/widgets/category_item.dart';
import 'package:elevate_ecommerce_app/presentation/home/views/widgets/occasion_item.dart';
import 'package:elevate_ecommerce_app/presentation/home/views/widgets/proudect_item.dart';
import 'package:elevate_ecommerce_app/presentation/home/views/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/const_keys.dart';
import '../../../core/di/di.dart';
import '../../main_home/manager/controller_home_provider.dart';
import '../view_models/home_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeViewModel>()..doIntent(OnLoadHomeListEvent()),

      child: Scaffold(
        backgroundColor: AppColors.white,

        body: BlocBuilder<HomeViewModel, HomeStates>(
          builder: (context, state) {
            if (state.homeListIsLoading){
              return const Center(
                child: Center(child: CircularProgressIndicator()),
              );
            }else{
              return SingleChildScrollView(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 4.h),
                            child: SvgPicture.asset(
                              AppImages.floweryIcon,
                              width: 12.w,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            AppLocalizations.of(context).flowery,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                              color: AppColors.mainColor,
                              fontWeight: FontWeight.w400,
                              fontFamily: ConstKeys.imFellEnglishFont,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: AppLocalizations.of(context).search,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: Icon(
                                    Icons.search,
                                    color: AppColors.white[70],
                                  ),
                                ),
                                prefixIconConstraints: BoxConstraints(
                                  minWidth: 20.w,
                                  minHeight: 30.h,
                                ),
                                border: buildSearchOutlineInputBorder(),
                                enabledBorder: buildSearchOutlineInputBorder(),
                                focusedBorder: buildSearchOutlineInputBorder(),
                                contentPadding: EdgeInsets.zero,
                                isDense: true,
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
                          AppLocalizations.of(context).deliverToSheikhZayed,
                          style: TextStyle(color: AppColors.black),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.mainColor,
                          size: 30,
                        ),
                      ],
                    ),

                    // Categories
                    SectionHeader(
                      title: AppLocalizations.of(context).categories,
                      onTap: () {
                        context.read<ControllerHomeProvider>().openCategory(null);
                      },
                    ),
                    SizedBox(
                      height: 120.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categoriesListSuccess.length,
                        itemBuilder: (context, index) {
                          final categories = state.categoriesListSuccess[index];
                          return CategoryItem(
                            image: categories.image ?? "",
                            label: categories.name ?? "",
                            onTap: () {
                              context.read<ControllerHomeProvider>().openCategory(
                                categories.id,
                              );
                            },
                          );
                        },
                      ),
                    ),
                    // Best Seller
                    SectionHeader(
                      title: AppLocalizations.of(context).bestSeller,
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.bestSeller);
                      },
                    ),
                    SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.bestSellerListSuccess.length,
                        itemBuilder: (context, index) {
                          final categories =
                          state.bestSellerListSuccess[index];
                          return ProductItem(
                            imageUrl: categories.imgCover ?? "",
                            title: categories.title ?? "",
                            price: categories.price!.toStringAsFixed(0),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteNames.productDetails,
                                arguments: categories.toProductEntity(),
                              );
                            },
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Occasion
                    SectionHeader(
                      title: AppLocalizations.of(context).occasion,
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.occasion);
                      },
                    ),

                    SizedBox(
                      height: 180.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final occasion = state.occasionListSuccess[index];
                          return OccasionItem(
                            imageUrl: occasion.image ?? "",
                            label: occasion.name ?? "",
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteNames.occasion,
                                arguments: occasion.id,
                              );
                            },
                          );
                        },
                        itemCount: state.occasionListSuccess.length,
                      ),
                    ),

                    SizedBox(height: 16.h),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  InputBorder buildSearchOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: AppColors.white[70]!, width: 1.w),
    );
  }
}
