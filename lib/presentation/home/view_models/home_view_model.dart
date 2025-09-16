import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/home/get_home_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/home/view_models/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domin/entities/home_entity.dart';
import 'home_event.dart';

@injectable
class HomeViewModel extends Cubit<HomeStates> {
  final GetHomeUseCase _getHomeUseCase;

  HomeViewModel(this._getHomeUseCase) : super(const HomeStates());

  void doIntent(HomeEvent event) {
    switch (event) {
      case OnLoadHomeListEvent():
        _getHome();
    }
  }

  late List<HomeEntity> homeListSuccess = [];

  Future<void> _getHome() async {
    emit(state.copyWith(homeListIsLoading: true));
    final result = await _getHomeUseCase.call();
    switch (result) {
      case ApiSuccessResult<HomeEntity>():
        emit(
          state.copyWith(
            homeListIsLoading: false,
            categoriesListSuccess: result.data.categories ?? [],
            occasionListSuccess: result.data.occasions ?? [],
            productListSuccess: result.data.products ?? [],
            bestSellerListSuccess: result.data.bestSeller ?? [],
          ),
        );

      case ApiErrorResult<HomeEntity>():
        emit(
          state.copyWith(
            homeListIsLoading: false,
            homeListErrorMessage: result.errorMessage,
          ),
        );
    }
  }
}
