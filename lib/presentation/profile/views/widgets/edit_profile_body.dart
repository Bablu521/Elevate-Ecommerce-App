import 'package:elevate_ecommerce_app/api/models/requestes/profile_request/update_profile_info_request/update_profile_info_request.dart';
import 'package:elevate_ecommerce_app/core/constants/const_keys.dart';
import 'package:elevate_ecommerce_app/core/utils/helper_function.dart';
import 'package:elevate_ecommerce_app/core/utils/loaders/loaders.dart';
import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/edit_profile_view_model/edit_profile_cubit.dart';
import 'package:elevate_ecommerce_app/presentation/profile/profile_view_model/edit_profile_view_model/edit_profile_event.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/custom_edit_image_profile.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/custom_edit_profile_radio.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/edit_profile_header.dart';
import 'package:elevate_ecommerce_app/presentation/profile/views/widgets/section_text_field_edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileBody extends StatefulWidget {
  const EditProfileBody({super.key});

  @override
  State<EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<EditProfileBody> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  late String initialFirstName;
  late String initialLastName;
  late String initialEmail;
  late String initialPhone;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  bool get isChanged {
    return firstNameController.text != initialFirstName ||
        lastNameController.text != initialLastName ||
        emailController.text != initialEmail ||
        phoneController.text != initialPhone;
  }

  bool _isInitialized = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);

    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (!_isInitialized && state.profileInfoState?.data != null) {
          final profile = state.profileInfoState!.data!;
          firstNameController.text = profile.firstName;
          lastNameController.text = profile.lastName;
          emailController.text = profile.email;
          phoneController.text = profile.phone;
          initialFirstName = firstNameController.text;
          initialLastName = lastNameController.text;
          initialEmail = emailController.text;
          initialPhone = phoneController.text;
          _isInitialized = true;
        }

        if (state.updateProfileInfoState?.isLoading == true) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state.updateProfileInfoState?.data != null) {
          HelperFunction.dismissDialog(context);
          Loaders.showSuccessMessage(
            message: state.updateProfileInfoState?.data?.message ?? "",
            context: context,
          );
        } else if (state.updateProfileInfoState?.errorMessage != null) {
          HelperFunction.dismissDialog(context);
          Loaders.showErrorMessage(
            message: state.updateProfileInfoState?.data?.message ?? "",
            context: context,
          );
        }
      },
      builder: (context, state) {
        if (state.profileInfoState?.isLoading == true) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.profileInfoState?.errorMessage != null) {
          return Center(child: Text(state.profileInfoState!.errorMessage!));
        }
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  const EditProfileHeader(),
                  SizedBox(height: 20.h),
                  const CustomEditImageProfile(),
                  SizedBox(height: 24.h),
                  SectionTextFieldEditProfile(
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    emailController: emailController,
                    phoneController: phoneController,
                  ),
                  SizedBox(height: 24.h),
                  CustomProfileRadio(
                    gender:
                        state.profileInfoState?.data?.gender ?? ConstKeys.kMale,
                  ),
                  SizedBox(height: 48.h),
                  SizedBox(
                    width: double.infinity,
                    child: ListenableBuilder(
                      listenable: Listenable.merge([
                        firstNameController,
                        lastNameController,
                        emailController,
                        phoneController,
                      ]),
                      builder: (context, child) {
                        final isValid = isChanged;
                        return ElevatedButton(
                          onPressed: isValid
                              ? () {
                                  context.read<EditProfileCubit>().doIntent(
                                    EditProfileUpdateProfileInfoEvent(
                                      request: UpdateProfileInfoRequest(
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                        email: emailController.text,
                                        phone: phoneController.text,
                                      ),
                                    ),
                                  );
                                }
                              : null,
                          child: Text(
                            local.update,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSecondary,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
