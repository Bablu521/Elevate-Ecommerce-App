import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/category_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_case/get_all_categories_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_case/get_all_products_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_case/get_products_by_category_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/categories/view_models/categories_events.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'categories_state.dart';

@injectable
class CategoriesViewModel extends Cubit<CategoriesState> {
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;
  final GetProductsByCategoryUseCase _getProductsByCategoryUseCase;

  CategoriesViewModel(
    this._getAllCategoriesUseCase,
    this._getProductsByCategoryUseCase,
    this._getAllProductsUseCase,
  ) : super(const CategoriesState());

  late final String categoryId;
  late final TickerProvider tabControllerVsync;
  late final TabController tabController;
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<int> selectedTabIndex = ValueNotifier<int>(0);
  List<ProductEntity>? productsList;

  void doIntent(CategoriesEvents events) {
    switch (events) {
      case GetCategoriesEvent():
        _getAllCategories();
      case GetAllProductsEvent():
        _getAllProducts();
      case GetProductsByCategoryEvent():
        _getProductsByCategory();
      case ProductsSearchEvent():
        _productsSearch();
    }
  }

  Future<void> _getAllCategories() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _getAllCategoriesUseCase();
    switch (result) {
      case ApiSuccessResult<List<CategoryEntity>>():
        initTabBarController(result.data.length);
        emit(state.copyWith(categoriesList: result.data, isLoading: false));
        selectTabByCategory();
      case ApiErrorResult<List<CategoryEntity>>():
        emit(
          state.copyWith(errorMessage: result.errorMessage, isLoading: false),
        );
    }
  }

  Future<void> _getAllProducts() async {
    emit(state.copyWith(isProductsLoading: true, errorMessage: null));
    final result = await _getAllProductsUseCase();
    switch (result) {
      case ApiSuccessResult<List<ProductEntity>>():
        productsList = result.data;
        emit(
          state.copyWith(productsList: result.data, isProductsLoading: false),
        );
      case ApiErrorResult<List<ProductEntity>>():
        emit(
          state.copyWith(
            errorMessage: result.errorMessage,
            isProductsLoading: false,
          ),
        );
    }
  }

  Future<void> _getProductsByCategory() async {
    emit(state.copyWith(isProductsLoading: true, errorMessage: null));
    final result = await _getProductsByCategoryUseCase(
      state.categoriesList![selectedTabIndex.value - 1].Id!,
    );
    switch (result) {
      case ApiSuccessResult<List<ProductEntity>>():
        productsList = result.data;

        emit(
          state.copyWith(productsList: result.data, isProductsLoading: false),
        );
      case ApiErrorResult<List<ProductEntity>>():
        emit(
          state.copyWith(
            errorMessage: result.errorMessage,
            isProductsLoading: false,
          ),
        );
    }
  }

  void _productsSearch() {
    emit(state.copyWith(isProductsLoading: true));
    List<ProductEntity> tempList;
    if (searchController.text.isNotEmpty) {
      tempList =
          productsList!
              .where(
                (product) => product.title!.toLowerCase().contains(
                  searchController.text.toLowerCase(),
                ),
              )
              .toList();
      emit(state.copyWith(productsList: tempList, isProductsLoading: false));
    } else {
      emit(
        state.copyWith(productsList: productsList, isProductsLoading: false),
      );
    }
  }

  void initTabBarController(int length) {
    tabController = TabController(
      length: length + 1,
      vsync: tabControllerVsync,
    );
    tabController.addListener(() {
      selectedTabIndex.value = tabController.index;
      if (tabController.index == 0) {
        _getAllProducts();
      } else {
        _getProductsByCategory();
      }
    });
  }

  void selectTabByCategory() {
    if (categoryId.isEmpty) {
      _getAllProducts();
      return;
    }
    state.categoriesList!.asMap().forEach((index, category) {
      if (category.Id == categoryId) {
        tabController.index = index + 1;
      }
    });
    _getProductsByCategory();
    if (tabController.index == 0) {
      _getAllProducts();
    } else {}
  }
}
