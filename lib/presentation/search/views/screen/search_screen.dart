import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/presentation/search/views/widget/search_search_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../view_models/search_view_model.dart';
import '../widget/search_products_section.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final SearchViewModel searchViewModel;

  @override
  void initState() {
    super.initState();
    searchViewModel = getIt<SearchViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            children: [
              SearchSearchSection(searchViewModel: searchViewModel),
              Expanded(
                child: BlocBuilder<SearchViewModel, SearchState>(
                  bloc: searchViewModel,
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.productsList != null &&
                        state.productsList!.isNotEmpty) {
                      return SearchProductsSection(
                        searchViewModel: searchViewModel,
                      );
                    } else {
                      return Center(
                        child: Text(
                          state.errorMessage != null || state.isProductsEmpty
                              ? AppLocalizations.of(context).noProductsAvailable
                              : AppLocalizations.of(
                                  context,
                                ).searchForAnyProductYouWant,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: AppColors.mainColor,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
