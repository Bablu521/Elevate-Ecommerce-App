import 'package:elevate_ecommerce_app/api/mapper/home/best_seller_mapper.dart';
import 'package:elevate_ecommerce_app/core/utils/widgets/custom_product_items.dart';
import 'package:elevate_ecommerce_app/presentation/best_seller/view_model/best_seller_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerBody extends StatelessWidget {
  const BestSellerBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerViewModelCubit, BestSellerViewModelState>(
      builder: (context, state) {
        if (state.stateBestSellerListProduct?.isLoading == true) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.stateBestSellerListProduct?.errorMessage != null) {
          return Center(
            child: Text(state.stateBestSellerListProduct!.errorMessage!),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GridView.builder(
              itemCount: state.stateBestSellerListProduct?.data?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 17,
                crossAxisSpacing: 17,
                childAspectRatio: 160 / 260,
              ),
              itemBuilder: (context, index) {
                return CustomProductItems(
                  productEntity: state.stateBestSellerListProduct!.data![index]
                      .toProductEntity(),
                );
              },
            ),
          );
        }
      },
    );
  }
}
