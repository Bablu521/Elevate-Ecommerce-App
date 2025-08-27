import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/core/router/route_names.dart';
import 'package:elevate_ecommerce_app/core/utils/widgets/custom_product_items.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/view_models/occasion_events.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/view_models/occasion_states.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/view_models/occasion_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OccasionViewBody extends StatefulWidget {
  final String? occasionId;

  const OccasionViewBody({super.key, this.occasionId});

  @override
  State<OccasionViewBody> createState() => _OccasionViewBodyState();
}

class _OccasionViewBodyState extends State<OccasionViewBody> {
  final OccasionViewModel occasionViewModel = getIt.get<OccasionViewModel>();
  int selectedIndex = 0;
  bool hasLoadedInitialProducts = false;

  @override
  void initState() {
    super.initState();
    occasionViewModel.doIntent(OnLoadOccasionListEvent());
    occasionViewModel.stream.listen((state) {
      if (!hasLoadedInitialProducts &&
          state.occasionListSuccess.isNotEmpty &&
          !state.occasionListIsLoading &&
          state.occasionListErrorMessage == null &&
          !state.productListIsLoading) {
        final occasionList = state.occasionListSuccess;
        final index =
            widget.occasionId != null
                ? occasionList.indexWhere(
                  (occasion) => occasion.id == widget.occasionId,
                )
                : 0;
        setState(() {
          if (index != -1) {
            selectedIndex = index;
          } else {
            selectedIndex = 0;
          }
        });
        final occasionId = occasionList[selectedIndex].id;
        hasLoadedInitialProducts = true;
        occasionViewModel.doIntent(OnLoadProductListEvent(occasionId!));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        BlocBuilder<OccasionViewModel, OccasionStates>(
          bloc: occasionViewModel,
          builder: (context, state) {
            if (state.occasionListIsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.occasionListErrorMessage != null) {
              return Center(child: Text(state.occasionListErrorMessage!));
            } else {
              final occasionList = state.occasionListSuccess;
              return DefaultTabController(
                initialIndex: selectedIndex,
                length: occasionList.length,
                child: Expanded(
                  child: Column(
                    children: [
                      TabBar(
                        onTap: (index) {
                          if (index != selectedIndex) {
                            final occasionId = occasionList[index].id;
                            if (occasionId != null) {
                              setState(() {
                                selectedIndex = index;
                              });
                              occasionViewModel.doIntent(
                                OnLoadProductListEvent(occasionId),
                              );
                            }
                          }
                        },
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        tabs:
                            occasionList.map((occasion) {
                              final isSelected = selectedIndex == occasionList.indexOf(occasion);
                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      width: 3.w,
                                      color:
                                          isSelected
                                              ? AppColors.mainColor
                                              : Colors.grey,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  occasion.name ?? AppLocalizations.of(context).occasion,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    color:
                                        isSelected
                                            ? AppColors.mainColor
                                            : AppColors.gray,
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                      SizedBox(height: 16.h),
                      Expanded(
                        child:
                            state.productListIsLoading
                                ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                                : state.productListErrorMessage != null
                                ? Center(
                                  child: Text(state.productListErrorMessage!),
                                )
                                : TabBarView(
                                  children:
                                      occasionList.map((occasion) {
                                        final products =
                                            state.productListSuccess;
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            top: 16.h,
                                            left: 16.w,
                                            right: 16.w,
                                          ),
                                          child:
                                              products.isEmpty
                                                  ? Center(
                                                    child: Text(
                                                      AppLocalizations.of(
                                                        context,
                                                      ).noProductsAvailable,
                                                    ),
                                                  )
                                                  : GridView.builder(
                                                    itemCount: products.length,
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          mainAxisSpacing: 17,
                                                          crossAxisSpacing: 17,
                                                          childAspectRatio:
                                                              163 / 229,
                                                        ),
                                                    itemBuilder: (
                                                      context,
                                                      index,
                                                    ) {
                                                      return InkWell(
                                                        onTap: (){
                                                          Navigator.of(context).pushNamed(
                                                            RouteNames.productDetails,
                                                            arguments: products[index],
                                                          );
                                                        },
                                                        child: CustomProductItems(
                                                          title:
                                                              products[index]
                                                                  .title ??
                                                              AppLocalizations.of(
                                                                context,
                                                              ).product,
                                                          imgCover:
                                                              products[index]
                                                                  .imgCover ??
                                                              "https://flower.elevateegy.com/uploads/fefa790a-f0c1-42a0-8699-34e8fc065812-cover_image.png",
                                                          priceAfterDiscount:
                                                              products[index]
                                                                  .priceAfterDiscount ??
                                                              0,
                                                          price:
                                                              products[index]
                                                                  .price ??
                                                              0,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                        );
                                      }).toList(),
                                ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
