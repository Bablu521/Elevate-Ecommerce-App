import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/widgets/custom_dialog.dart';
import '../../../../generated/l10n.dart';
import '../../view_models/categories_events.dart';
import '../../view_models/categories_view_model.dart';
import '../widget/categories_tab_bar.dart';
import '../widget/categories_tab_bar_view.dart';

class CategoriesPage extends StatefulWidget {
  final String categoryId;

  const CategoriesPage({super.key, required this.categoryId});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with TickerProviderStateMixin {
  late final CategoriesViewModel categoriesViewModel;

  @override
  void initState() {
    super.initState();
    categoriesViewModel = getIt<CategoriesViewModel>();
    categoriesViewModel.tabControllerVsync = this;
    categoriesViewModel.categoryId = widget.categoryId;
    categoriesViewModel.doIntent(GetCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<CategoriesViewModel, CategoriesState>(
          bloc: categoriesViewModel,
          listener: (context, state) {
            if (state.errorMessage != null) {
              CustomDialog.positiveButton(
                context: context,
                title: AppLocalizations.of(context).error,
                message: state.errorMessage,
              );
            }
          },
          builder: (context, state) {
            if (state.isLoading == false) {
              return state.categoriesList != null ||
                      state.categoriesList?.isNotEmpty == true
                  ? Stack(
                    children: [
                      Column(
                        spacing: 16.h,
                        children: [
                          SizedBox(height: 16.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Row(
                              spacing: 8.w,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: TextFormField(
                                    controller:
                                        categoriesViewModel.searchController,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    textInputAction: TextInputAction.search,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: AppColors.white[70],
                                      ),
                                      hintText:
                                          AppLocalizations.of(context).search,
                                      border: searchOutlineInputBorder(),
                                      focusedBorder: searchOutlineInputBorder(),
                                      enabledBorder: searchOutlineInputBorder(),
                                    ),
                                    onChanged: (_) {
                                      categoriesViewModel.doIntent(
                                        ProductsSearchEvent(),
                                      );
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    style: Theme.of(
                                      context,
                                    ).elevatedButtonTheme.style!.copyWith(
                                      minimumSize: WidgetStateProperty.all(
                                        Size(double.infinity, 48.h),
                                      ),
                                      padding: WidgetStateProperty.all(
                                        EdgeInsets.zero,
                                      ),
                                      backgroundColor: WidgetStateProperty.all(
                                        AppColors.white,
                                      ),
                                      iconColor: WidgetStateProperty.all(
                                        AppColors.white[70],
                                      ),
                                      shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            4.r,
                                          ),
                                        ),
                                      ),
                                      side: WidgetStateProperty.all(
                                        BorderSide(
                                          color: AppColors.white[70]!,
                                          width: 1.w,
                                        ),
                                      ),
                                    ),
                                    label: SvgPicture.asset(
                                      AppImages.filterIcon,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ValueListenableBuilder(
                            valueListenable:
                                categoriesViewModel.selectedTabIndex,
                            builder: (
                              BuildContext context,
                              selectedIndex,
                              Widget? child,
                            ) {
                              return CategoriesTabBar(
                                categoriesViewModel: categoriesViewModel,
                              );
                            },
                          ),
                          Expanded(
                            child: Builder(
                              builder: (_) {
                                if (state.isProductsLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                if (state.productsList == null ||
                                    state.productsList?.isEmpty == true) {
                                  return Center(
                                    child: Text(
                                      AppLocalizations.of(
                                        context,
                                      ).noProductsAvailable,
                                    ),
                                  );
                                }
                                return TabBarView(
                                  controller: categoriesViewModel.tabController,
                                  children: [
                                    CategoriesTabBarView(
                                      categoriesViewModel: categoriesViewModel,
                                    ),
                                    ...?state.categoriesList?.map(
                                      (_) => CategoriesTabBarView(
                                        categoriesViewModel:
                                            categoriesViewModel,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: SvgPicture.asset(AppImages.bottomFilterIcon),
                            label: Text(
                              AppLocalizations.of(context).filter,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(),
                          ),
                        ),
                      ),
                    ],
                  )
                  : Center(
                    child: Text(
                      AppLocalizations.of(context).noCategoriesAvailable,
                    ),
                  );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  InputBorder searchOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide(color: AppColors.white[70]!, width: 1.w),
    );
  }
}
