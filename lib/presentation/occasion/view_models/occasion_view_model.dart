import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/domin/entities/occasion_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/product_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_products_by_occasion_use_case.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/occasion_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/view_models/occasion_events.dart';
import 'package:elevate_ecommerce_app/presentation/occasion/view_models/occasion_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionViewModel extends Cubit<OccasionStates> {
  final OccasionUseCase _occasionUseCase;
  final GetProductsByOccasionUseCase _getProductsByOccasionUseCase;
  OccasionViewModel(this._occasionUseCase, this._getProductsByOccasionUseCase)
    : super(OccasionStates());

  void doIntent(OccasionEvent event) {
    switch (event) {
      case OnLoadOccasionListEvent():
        _getAllOccasions();
      case OnLoadProductListEvent(occasionId: final occasionId):
        _getProductsByOccasion(occasionId);
    }
  }

  late List<OccasionEntity> occasionListSuccess = [];

  Future<void> _getAllOccasions() async {
    emit(state.copyWith(occasionListIsLoading: true));
    var result = await _occasionUseCase.call();
    switch (result) {
      case ApiSuccessResult<List<OccasionEntity>>():
        emit(
          state.copyWith(
            occasionListIsLoading: false,
            occasionListSuccess: result.data,
          ),
        );
      case ApiErrorResult<List<OccasionEntity>>():
        emit(
          state.copyWith(
            occasionListIsLoading: false,
            occasionListErrorMessage: result.errorMessage,
          ),
        );
    }
  }

  Future<void> _getProductsByOccasion(String occasionId) async {
    emit(state.copyWith(productListIsLoading: true));
    var result = await _getProductsByOccasionUseCase(occasionId);
    switch (result) {
      case ApiSuccessResult<List<ProductEntity>>():
        emit(
          state.copyWith(
            productListIsLoading: false,
            productListSuccess: result.data,
          ),
        );
      case ApiErrorResult<List<ProductEntity>>():
        emit(
          state.copyWith(
            productListIsLoading: false,
            productListErrorMessage: result.errorMessage,
          ),
        );
    }
  }
}
