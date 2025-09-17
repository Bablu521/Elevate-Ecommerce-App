import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/presentation/checkout/views/widget/checkout_delivery_time_section.dart';
import 'package:elevate_ecommerce_app/presentation/checkout/views/widget/checkout_is_gift_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/custom_widget/custom_dialog.dart';
import '../../../../core/di/di.dart';
import '../../../../generated/l10n.dart';
import '../../view_models/checkout_events.dart';
import '../../view_models/checkout_view_model.dart';
import '../widget/checkout_delivery_address_section.dart';
import '../widget/checkout_footer_section.dart';
import '../widget/checkout_payment_method_section.dart';
import '../widget/checkout_webview_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late final CheckoutViewModel checkoutViewModel;
  bool isDialogOpen = false;

  @override
  void initState() {
    super.initState();
    checkoutViewModel = getIt<CheckoutViewModel>();
    checkoutViewModel.doIntent(GetUserCartEvent());
    checkoutViewModel.doIntent(GetUserAddressesEvent());
  }

  @override
  void dispose() {
    checkoutViewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(AppLocalizations.of(context).checkout),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocConsumer<CheckoutViewModel, CheckoutState>(
        bloc: checkoutViewModel,
        listener: (context, state) {
          if (isDialogOpen) {
            Navigator.of(context).pop();
            isDialogOpen = false;
          }

          if (state.isLoading) {
            CustomDialog.loading(context: context);
            isDialogOpen = true;
          } else if (state.errorMessage != null) {
            CustomDialog.positiveButton(
              context: context,
              title: AppLocalizations.of(context).error,
              message: state.errorMessage,
            );
          } else if (state.isSuccessCashOrder) {
            /*Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.orders, (_) => false);*/
          } else if (state.isSuccessCreditOrder) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    CheckoutWebviewScreen(checkoutViewModel: checkoutViewModel),
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              spacing: 24.h,
              children: [
                const CheckoutDeliveryTimeSection(),
                CheckoutDeliveryAddressSection(
                  checkoutViewModel: checkoutViewModel,
                ),
                CheckoutPaymentMethodSection(
                  checkoutViewModel: checkoutViewModel,
                ),
                ValueListenableBuilder(
                  valueListenable: checkoutViewModel.selectedPaymentIndex,
                  builder: (context, value, child) {
                    return Visibility(
                      visible: value == 1,
                      child: CheckoutIsGiftSection(
                        checkoutViewModel: checkoutViewModel,
                      ),
                    );
                  },
                ),
                if (state.subTotal != 0) ...[
                  CheckoutFooterSection(checkoutViewModel: checkoutViewModel),
                ] else ...[
                  const CircularProgressIndicator(),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
