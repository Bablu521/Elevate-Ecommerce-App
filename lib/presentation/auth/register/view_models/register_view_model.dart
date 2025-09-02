import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/core/enums/gender_enum.dart';
import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/register_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/view_models/register_events.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/view_models/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  final RegisterUseCase _registerUseCase;
  RegisterViewModel(this._registerUseCase) : super(const RegisterStates());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  Gender? selectedGender;

  void doIntent(RegisterEvents event) async {
    switch (event) {
      case OnSignUpClickEvent():
        _register();
        break;
    }
  }

  Future<void> _register() async {
    emit(state.copyWith(isLoading: true));
    final result = await _registerUseCase.call(
      RegisterRequestEntity(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: passwordController.text,
        rePassword: confirmPasswordController.text,
        phone: phoneNumberController.text,
        gender: selectedGender?.name,
      ),
    );
    switch (result) {
      case ApiSuccessResult<RegisterEntity>():
        emit(state.copyWith(isLoading: false, data: result.data));
      case ApiErrorResult<RegisterEntity>():
        emit(
          state.copyWith(isLoading: false, errorMessage: result.errorMessage),
        );
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}
