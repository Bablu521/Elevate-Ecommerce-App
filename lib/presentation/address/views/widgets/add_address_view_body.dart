import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/utils/validations.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressViewBody extends StatefulWidget {
  const AddAddressViewBody({super.key});

  @override
  State<AddAddressViewBody> createState() => _AddAddressViewBodyState();
}

class _AddAddressViewBodyState extends State<AddAddressViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController addressContoller = TextEditingController();
  TextEditingController phoneNumberContoller = TextEditingController();
  TextEditingController recipientNameContoller = TextEditingController();
  late String? selectedCity;
  late String? selectedArea;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Container(height: 145.h, color: AppColors.black[10]),
            SizedBox(height: 24.h),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: addressContoller,
                    validator: Validations.validateAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).address,
                      hintText: AppLocalizations.of(context).enterTheAddress,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  TextFormField(
                    controller: phoneNumberContoller,
                    validator: Validations.validatePhoneNumber,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).phoneNumber,
                      hintText: AppLocalizations.of(context).enterPhoneNumber,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  TextFormField(
                    controller: recipientNameContoller,
                    validator: Validations.validateRecipientName,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).recipientName,
                      hintText: AppLocalizations.of(
                        context,
                      ).enterTheRecipientName,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                          style: Theme.of(context).textTheme.bodySmall,
                          initialValue: "Cairo",
                          isExpanded: true,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).city,
                          ),
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value;
                            });
                          },
                          items: ["Cairo", "Alex", "Mansoura"]
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      SizedBox(width: 17.w,),
                      Expanded(
                        child: DropdownButtonFormField(
                          style: Theme.of(context).textTheme.bodySmall,
                          initialValue: "Hay-El Gamaa",
                          isExpanded: true,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).area,
                          ),
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value;
                            });
                          },
                          items: ["Talkha" , "Taraa" , "Hay-El Gamaa" , "El Galaa"]
                              .map(
                                (item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 48.h),
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // add or update address
                },
                child: Text(AppLocalizations.of(context).saveAddress),
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
