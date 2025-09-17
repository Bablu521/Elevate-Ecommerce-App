import 'package:elevate_ecommerce_app/presentation/checkout/view_models/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutWebviewScreen extends StatelessWidget {
  final CheckoutViewModel checkoutViewModel;

  const CheckoutWebviewScreen({super.key, required this.checkoutViewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: checkoutViewModel.webViewController!),
    );
  }
}
