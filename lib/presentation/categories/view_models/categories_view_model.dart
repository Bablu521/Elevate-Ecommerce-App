import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/core/base_state/base_state.dart';
import 'package:elevate_ecommerce_app/domin/entities/cart_response_entity/cart_response_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/category_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/add_product_to_cart_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_all_categories_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_all_products_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/categories/view_models/categories_events.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/enums/product_sort_enum.dart';
import '../../../domin/use_cases/get_products_by_category_use_case.dart';

part 'categories_state.dart';

@injectable
class CategoriesViewModel extends Cubit<CategoriesState> {
  final GetAllCategoriesUseCase _getAllCategoriesUseCase;
  final GetAllProductsUseCase _getAllProductsUseCase;
  final GetProductsByCategoryUseCase _getProductsByCategoryUseCase;
  final AddProductToCartUseCase _addProductToCartUseCase;

  CategoriesViewModel(
    this._getAllCategoriesUseCase,
    this._getProductsByCategoryUseCase,
    this._getAllProductsUseCase,
    this._addProductToCartUseCase,
  ) : super(const CategoriesState());

  late final String categoryId;
  late final TickerProvider tabControllerVsync;
  TabController? tabController;
  final ValueNotifier<int> selectedTabIndex = ValueNotifier(0);
  final ValueNotifier<ProductSortEnum?> selectedFilterIndex = ValueNotifier(
    null,
  );
  List<ProductEntity>? productsList;
  List<CategoryEntity>? categoriesList;

  void doIntent(CategoriesEvents events) {
    switch (events) {
      case GetCategoriesEvent():
        _getAllCategories();
      case GetAllProductsEvent():
        _getAllProducts();
      case GetProductsByCategoryEvent():
        _getProductsByCategory();
      case InitTabBarEvent():
        _initTabBarController();
      case CategoriesAddToCartEvent():
        _addToCart(events.productId);
      case ChangeSelectedFilterEvent():
        _changeSelectedFilter(events.sort);
      case ProductsSortEvent():
        _productsSort();
    }
  }

  Future<void> _getAllCategories() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _getAllCategoriesUseCase();
    switch (result) {
      case ApiSuccessResult<List<CategoryEntity>>():
        categoriesList = result.data;
        emit(state.copyWith(categoriesList: result.data, isLoading: false));
      case ApiErrorResult<List<CategoryEntity>>():
        emit(
          state.copyWith(errorMessage: result.errorMessage, isLoading: false),
        );
    }
  }

  Future<void> _getAllProducts({ProductSortEnum? sort}) async {
    emit(state.copyWith(isProductsLoading: true, errorMessage: null));
    final result = await _getAllProductsUseCase(sort: sort);
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
      categoriesList![selectedTabIndex.value - 1].id!,
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

  void _initTabBarController() {
    tabController = TabController(
      length: categoriesList!.length + 1,
      vsync: tabControllerVsync,
    );
    tabController!.addListener(() {
      selectedTabIndex.value = tabController!.index;
      selectedFilterIndex.value = null;
      if (tabController!.index == 0) {
        _getAllProducts();
      } else {
        _getProductsByCategory();
      }
    });

    if (categoryId.isEmpty) {
      _getAllProducts();
      return;
    }
    categoriesList!.asMap().forEach((index, category) {
      if (category.id == categoryId) {
        tabController!.index = index + 1;
      }
    });
    if (tabController!.index == 0) {
      _getAllProducts();
    } else {
      _getProductsByCategory();
    }
  }

  Future<void> _addToCart(String? id) async {
    emit(
      state.copyWith(
        cartStates: {...state.cartStates, id: BaseState.loading()},
      ),
    );
    final result = await _addProductToCartUseCase.call(
      AddProductToCartRequestEntity(product: id, quantity: 1),
    );
    switch (result) {
      case ApiSuccessResult<CartResponseEntity>():
        emit(
          state.copyWith(
            cartStates: {
              ...state.cartStates,
              id: BaseState.success(result.data),
            },
          ),
        );
      case ApiErrorResult<CartResponseEntity>():
        emit(
          state.copyWith(
            cartStates: {
              ...state.cartStates,
              id: BaseState.error(result.errorMessage),
            },
          ),
        );
    }
  }

  void _changeSelectedFilter(ProductSortEnum? sort) {
    selectedFilterIndex.value = sort;
  }

  void _productsSort() {
    _getAllProducts(sort: selectedFilterIndex.value);
  }
}
