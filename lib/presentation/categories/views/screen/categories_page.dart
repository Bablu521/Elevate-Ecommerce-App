import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/presentation/categories/views/widget/categories_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/custom_dialog.dart';
import '../../../../generated/l10n.dart';
import '../../view_models/categories_events.dart';
import '../../view_models/categories_view_model.dart';

class CategoriesPage extends StatefulWidget {
  final String? categoryId;

  const CategoriesPage({super.key, this.categoryId});

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
    categoriesViewModel.categoryId = widget.categoryId ?? "";
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
              if (categoriesViewModel.tabController == null &&
                  state.categoriesList != null) {
                categoriesViewModel.doIntent(InitTabBarEvent());
              }
              return state.categoriesList != null ||
                      state.categoriesList?.isNotEmpty == true
                  ? CategoriesViewBody(categoriesViewModel: categoriesViewModel)
                  : Center(
                      child: Text(
                        AppLocalizations.of(context).noCategoriesAvailable,
                      ),
                    );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
