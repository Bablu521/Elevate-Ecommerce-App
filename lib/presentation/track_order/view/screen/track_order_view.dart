import 'package:elevate_ecommerce_app/core/di/di.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/track_order/view/widgets/track_order_body.dart';
import 'package:elevate_ecommerce_app/presentation/track_order/view_model/track_order_view_model_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/track_order/view_model/track_order_view_model_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackOrderView extends StatelessWidget {
  final String orderId;
  const TrackOrderView({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations().trackOrder,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        ),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: false,
      ),
      body: BlocProvider(
        create: (context) => getIt.get<TrackOrderViewModelCubit>()
          ..doIntent(
            TrackOrderViewModelGetOrderFromFireBaseEvent(
              orderId: orderId,
            ),
          ),
        child: const TrackOrderBody(),
      ),
    );
  }
}
