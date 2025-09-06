import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/edit_profile_view_model/edit_profile_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/edit_profile_view_model/edit_profile_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CustomEditImageProfile extends StatelessWidget {
  const CustomEditImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    return SizedBox(
      width: mediaQuery.width * 0.23.w,
      height: mediaQuery.width * 0.23.h,
      child: BlocBuilder<EditProfileCubit, EditProfileState>(
        builder: (context, state) {
          if (state.profileInfoState?.isLoading == true ||
              state.uploadImageProfileState?.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: state.localPickedImage == null
                    ? NetworkImage(state.profileInfoState!.data!.imagePath)
                    : FileImage(state.localPickedImage!),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: AppColors.lightPink,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.read<EditProfileCubit>().doIntent(
                        EditProfileUploadImageEvent(
                          imageSource: ImageSource.gallery,
                        ),
                      );
                    },
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.gray,
                      size: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
