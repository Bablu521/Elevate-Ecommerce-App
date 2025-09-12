import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/domin/models/response/order_page/orders_page.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/widgets/custom_widget.dart';

class OrderWidget extends StatelessWidget {

  final OrdersEntity orders;
  const OrderWidget({required this.orders});

  @override
  Widget build(BuildContext context) {
    return Column(
     children: [
       SizedBox(
        width: 380,
        height: 160,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.grey, width: 1.5),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
            child: Row(
              children: [

                ClipRRect(
                  child:
                  Image.asset("assets/icons/orderimage.png")
                ),
                const SizedBox(width: 32),


                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(

                            "Red roses",
                            style: Theme.of(context).textTheme.titleMedium?.
                            copyWith(color:AppColors.black ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "${orders.totalPrice}",
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium?.copyWith(color: AppColors.black ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            overflow:TextOverflow.ellipsis ,
                              "${orders.orderNumber}",
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: AppColors.gray),
                          ),
                          const SizedBox(height: 4),

                        ],
                      ),
                      SizedBox(
                        height: 30,
                        width: 130,
                        child: CustomButton(
                          textStyle: const TextStyle(color: Colors.white),
                          buttonColor: Colors.pink,
                          text: "Track Order",
                          onButtonClicked: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),]
    );
  }
}
