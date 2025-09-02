import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/cart/view_models/cart_events.dart';
import 'package:elevate_ecommerce_app/presentation/cart/view_models/cart_states.dart';
import 'package:elevate_ecommerce_app/presentation/cart/view_models/cart_view_model.dart';
import 'package:elevate_ecommerce_app/presentation/cart/views/widgets/cart_billing_section.dart';
import 'package:elevate_ecommerce_app/presentation/cart/views/widgets/cart_item.dart';
import 'package:elevate_ecommerce_app/presentation/cart/views/widgets/custom_cart_address.dart';
import 'package:elevate_ecommerce_app/presentation/cart/views/widgets/custom_cart_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    cartViewModel.doIntent(OnLoadLoggedUserCartDataEvent());
    super.initState();
  }

  final CartViewModel cartViewModel = getIt.get<CartViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewModel, CartStates>(
      bloc: cartViewModel,
      builder: (context, state) {
        if (state.cartDataLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.mainColor),
          );
        } else if (state.cartDataErrorMessage != null) {
          return Center(child: Text(state.cartDataErrorMessage!));
        } else if (state.cartDataSuccess == null && !state.cartDataLoading) {
          return Center(child: Text(AppLocalizations.of(context).cartIsEmpty));
        } else if ((state.cartDataSuccess?.cart?.cartItems?.isEmpty ?? true) && !state.cartDataLoading) {
          return Center(child: Text(AppLocalizations.of(context).cartIsEmpty,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.mainColor
          ),));
        } else {
          final response = state.cartDataSuccess!;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCartAppBar(
                      numOfCartItems: response.numOfCartItems ?? 0,
                    ),
                    SizedBox(height: 8.h),
                    const CustomCartAddress(),
                    SizedBox(height: 8.h),
                    Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: TextButton(
                        onPressed: () {
                          cartViewModel.doIntent(OnClearUserCartEvent());
                        },
                        child: Text(
                          AppLocalizations.of(context).clearCart,
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                color: AppColors.mainColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: response.cart?.cartItems?.length ?? 0,
                      itemBuilder: (context, index) {
                        final cartItem = response.cart?.cartItems?[index];
                        if (cartItem == null) {
                          return const SizedBox.shrink();
                        }
                        return CartItem(
                          cartItem: cartItem,
                          cartViewModel: cartViewModel,
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    CartBillingSection(response: response),
                    SizedBox(height: 48.h),
                    SizedBox(
                      height: 48.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(AppLocalizations.of(context).checkout),
                      ),
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
