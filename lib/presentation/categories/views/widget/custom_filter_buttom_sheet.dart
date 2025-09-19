import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view_models/categories_events.dart';
import '../../view_models/categories_view_model.dart';

class CustomButtonSheet extends StatefulWidget {
  CategoriesViewModel categoriesViewModel;

  CustomButtonSheet({required this.categoriesViewModel});

  @override
  State<CustomButtonSheet> createState() => _CustomButtonSheetState();
}

class _CustomButtonSheetState extends State<CustomButtonSheet> {
  String? selectedVal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.55.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16.h,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                width: 80.w,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.gray,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Text(
                    "Sort by",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        fontFamily: ConstKeys.outfitFont,
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                             "Lowes Price",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontFamily: ConstKeys.outfitFont,
                              ),
                            ),
                            const Spacer(),
                            Radio(
                              value: "price",
                              groupValue: selectedVal,
                              onChanged: (value) =>   {
                                setState(() {
                                  selectedVal=value;
                                }),

                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                              "Highest Price ",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontFamily: ConstKeys.outfitFont,
                              ),
                            ),
                            const Spacer(),
                            Radio(
                                value: "-price",
                                groupValue: selectedVal,
                                onChanged: (value) =>
                                {
                                  setState(() {
                                    selectedVal=value;
                                  }),

                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                   Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                              "New",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontFamily: ConstKeys.outfitFont,
                              ),
                            ),
                            const Spacer(),
                            Radio(
                              value:"new",
                              groupValue: selectedVal,
                              onChanged: (value) =>
                              {
                                setState(() {
                                  selectedVal=value;
                                }),

                              },
                            ),
                          ],
                        ),
                      ),
                    ), Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                              "Old",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontFamily: ConstKeys.outfitFont,
                              ),
                            ),
                            const Spacer(),
                            Radio(
                              value:"old",
                              groupValue: selectedVal,
                              onChanged: (value) =>
                              {
                                setState(() {
                                  selectedVal=value;
                                }),

                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Text(
                              "Discount ",
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontFamily: ConstKeys.outfitFont,
                              ),
                            ),
                            const Spacer(),
                            Radio(
                              value:"discount",
                              groupValue: selectedVal,
                              onChanged: (value) =>
                              {
                                setState(() {
                              selectedVal=value;
                              }),

                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(onPressed: (){

                        widget.categoriesViewModel.doIntent(
                          ProductsFilterEvent(sort: selectedVal),
                        );
                        Navigator.of(context).pop();
                      },
                          child: const Text("Filter")),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}