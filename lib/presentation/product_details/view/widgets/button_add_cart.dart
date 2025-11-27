import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/utils/loaders/loaders.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/add_product_to_cart_request_entity.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/product_details/view_model/product_details_event.dart';
import 'package:elevate_ecommerce_app/presentation/product_details/view_model/product_details_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonAddCart extends StatelessWidget {
  const ButtonAddCart({super.key, this.productID});
  final String? productID;
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 45.h,
        child:
            BlocConsumer<
              ProductDetailsViewModelCubit,
              ProductDetailsViewModelState
            >(
              listener: (context, state) {
                if (state.addToCartState?.errorMessage != null) {
                  Loaders.showErrorMessage(
                    message: state.addToCartState?.errorMessage ?? local.error,
                    context: context,
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    backgroundColor: state.addToCartState?.data == null
                        ? theme.colorScheme.primary
                        : AppColors.green,
                  ),
                  onPressed: () {
                    context.read<ProductDetailsViewModelCubit>().doIntent(
                      ProductDetailsAddToCartEvent(
                        request: AddProductToCartRequestEntity(
                          product: productID,
                          quantity: 1,
                        ),
                      ),
                    );
                  },
                  child: state.addToCartState?.isLoading == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: theme.colorScheme.onSecondary,
                            padding: const EdgeInsets.symmetric(vertical: 4),
                          ),
                        )
                      : state.addToCartState?.data != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 4,
                          children: [
                            Text(local.added),
                            const Icon(Icons.add_task_outlined),
                          ],
                        )
                      : Text(local.addToCart),
                );
              },
            ),
      ),
    );
  }
}
