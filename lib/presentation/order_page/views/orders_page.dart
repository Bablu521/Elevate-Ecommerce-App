import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/order_page/view_model/order_view_model.dart';
import 'package:elevate_ecommerce_app/presentation/order_page/view_model/orders_event.dart';
import 'package:elevate_ecommerce_app/presentation/order_page/view_model/orders_state.dart';
import 'package:elevate_ecommerce_app/presentation/order_page/views/widgets/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/di/di.dart';
import '../../../core/utils/widgets/user_guest_mode_page.dart';

class OrdersPage extends StatelessWidget {


  const OrdersPage({super.key});



  @override
  Widget build(BuildContext context) {



    return BlocProvider(

        create: (_) => getIt<OrderViewModel>()..doIntent(OnLoadOrdersEvent()),

        child: BlocBuilder<OrderViewModel, OrdersStates>(
        builder: (context, state) {

          final vm = context.read<OrderViewModel>();
          final activeOrders = vm.activeOrders;
          final completedOrders = vm.completedOrders;


          if (state.isLogged == false) {
            return const UserGuestModePage();
          } else if (state.ordersListIsLoading == true) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.ordersListErrorMessage != null) {
            return Center(child: Text(state.ordersListErrorMessage ??"error"),);

          }else{
          return  DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    AppLocalizations
                        .of(context)
                        .myOrders,
                    style: Theme
                        .of(context)
                        .appBarTheme
                        .titleTextStyle,
                  ),
                  bottom: TabBar(
                    indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                          width: 3, color: AppColors.mainColor),
                      insets: const EdgeInsets.symmetric(
                        horizontal: 135, // نص الشاشة
                      ),),

                    dividerHeight: 1.5,
                    dividerColor: AppColors.gray.withAlpha(100),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: AppColors.mainColor,
                    indicatorWeight: 2,

                    labelColor: AppColors.mainColor,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(child: Text(AppLocalizations
                          .of(context)
                          .active,
                      ),

                      ),
                      Tab(child: Text(AppLocalizations
                          .of(context)
                          .completed,
                      )

                      ),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    ///Active orders
                    ListView.builder(
                      itemBuilder: (context, index) {
                       return OrderWidget(orders: activeOrders[index],);
                    },
                      itemCount:activeOrders.length,
                      padding: EdgeInsets.all(16),
                    ),
                     ///Completed Orders
                    ListView.builder(itemBuilder: (context, index) {

                      return OrderWidget(orders:completedOrders[index],);
                    },
                      itemCount:completedOrders.length,
                      padding: const EdgeInsets.all(16),
                    ),
                  ],
                ),
              ),
            );
          }
        }
        )
    );

  }
}
