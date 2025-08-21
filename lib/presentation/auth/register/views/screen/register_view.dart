import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: Navigator.of(context).maybePop,
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text(AppLocalizations().signUp),
      ),
      body: SingleChildScrollView(child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 24.h,),
            Form(
              key: formKey,
              child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: TextFormField(
                      controller: firstNameController,
                      cursorColor: AppColors.white,
                      style: Theme.of(context).textTheme.bodyLarge,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 16.w,
                          top: 4.h,
                          bottom: 4.h
                        ),
                        labelText: "First name",
                        labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.white
                        ),
                        hintText: "Enter first name",
                        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.white
                        ),
                        
                        enabledBorder: customOutlineInputBorder(color: AppColors.white,
                              ),
                        focusedBorder: customOutlineInputBorder(color: AppColors.white,
                              ),
                        errorBorder: customOutlineInputBorder(color: AppColors.red)
                      ),
                    )),
                    SizedBox(width: 17.w,),
                    Expanded(child: SizedBox()),
                        
                  ],
                ),
              ],
            ))
          ],
        ),
      )),
    );
  }

  OutlineInputBorder customOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(
                          color: color
                        )
                      );
  }
}
