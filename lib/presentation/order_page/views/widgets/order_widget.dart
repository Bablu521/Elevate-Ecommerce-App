import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/app_images.dart';
import 'package:elevate_ecommerce_app/domin/entities/orders_page_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/widgets/custom_widget.dart';

class OrderWidget extends StatelessWidget {

  final OrdersEntity orders;
  const OrderWidget({super.key, required this.orders});

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
                  Image.asset(AppImages.orderImage)
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
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "EGP ${orders.totalPrice}",
                            style: Theme.of(
                              context,
                            ).textTheme.headlineSmall
                                  ?.copyWith(color: AppColors.black ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            maxLines: 1,
                            overflow:TextOverflow.ellipsis ,
                              "Order number ${orders.orderNumber}",
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: AppColors.gray),
                          ),
                          const SizedBox(height: 4),

                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                        width: 152.w,
                        child: CustomButton(
                          textStyle: const TextStyle(color: Colors.white),
                          buttonColor: AppColors.mainColor,
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
