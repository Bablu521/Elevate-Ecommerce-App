import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/core/base_state/base_state.dart';
import 'package:elevate_ecommerce_app/domin/entities/best_seller_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/get_best_seller_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/best_seller/view_model/best_seller_event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'best_seller_view_model_state.dart';

@lazySingleton
class BestSellerViewModelCubit extends Cubit<BestSellerViewModelState> {
  BestSellerViewModelCubit(this._getBestSellerUseCase)
    : super(const BestSellerViewModelState());
  final GetBestSellerUseCase _getBestSellerUseCase;
  Future<void> doIntent(BestSellerEvent event) async {
    switch (event) {
      case GetBestSellerEvent():
        await _getBestSellerPro();
    }
  }

  Future<void> _getBestSellerPro() async {
    emit(state.copyWith(stateBestSellerListProduct: BaseState.loading()));
    final result = await _getBestSellerUseCase.call();
    switch (result) {
      case ApiSuccessResult<List<BestSellerProductEntity>>():
        emit(
          state.copyWith(
            stateBestSellerListProduct: BaseState.success(result.data),
          ),
        );
      case ApiErrorResult<List<BestSellerProductEntity>>():
        emit(
          state.copyWith(
            stateBestSellerListProduct: BaseState.error(result.errorMessage),
          ),
        );
    }
  }
}
