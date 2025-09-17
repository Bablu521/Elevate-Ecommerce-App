import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_ecommerce_app/core/api_result/api_result.dart';
import 'package:elevate_ecommerce_app/core/enums/gender_enum.dart';
import 'package:elevate_ecommerce_app/domin/entities/register_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/requests/register_request_entity.dart';
import 'package:elevate_ecommerce_app/domin/use_cases/register_use_case.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/view_models/register_events.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/view_models/register_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_ecommerce_app/presentation/auth/register/view_models/register_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'register_view_model_test.mocks.dart';

@GenerateMocks([RegisterUseCase])
void main() {
  group('RegisterViewModel Test', () {
    late MockRegisterUseCase mockedRegisterUseCase;
    late RegisterViewModel registerViewModel;
    late RegisterStates state;
    late RegisterRequestEntity registerRequestEntity;

    setUp(() {
      mockedRegisterUseCase = MockRegisterUseCase();
      registerViewModel = RegisterViewModel(mockedRegisterUseCase);
      state = const RegisterStates();

      registerRequestEntity = RegisterRequestEntity(
        firstName: "fake-firstName",
        lastName: "fake-lastName",
        email: "fake-email",
        password: "fake-password",
        rePassword: "fake-repassword",
        phone: "fake-phone",
        gender: Gender.male.name,
      );
    });

    final RegisterEntity expectedEntity = const RegisterEntity(
      firstName: "fake-firstName",
      lastName: "fake-lastName",
      email: "fake-email",
      gender: "male",
      phone: "fake-phone",
      photo: "fake-photo",
      role: "fake-role",
      wishlist: ["fake-wishlist"],
      id: "fake-id",
      addresses: ["fake-addresses"],
    );
    final expectedResult = ApiSuccessResult<RegisterEntity>(expectedEntity);
    provideDummy<ApiResult<RegisterEntity>>(expectedResult);

    final errorMsg = "Server Error";
    final expectedError = ApiErrorResult<RegisterEntity>(errorMsg);
    provideDummy<ApiResult<RegisterEntity>>(expectedError);

    blocTest<RegisterViewModel, RegisterStates>(
      'call doIntent with OnSignUpClickEvent then load and successed',
      build: () => registerViewModel,
      act: (registerViewModel) async {
        when(
          mockedRegisterUseCase.call(registerRequestEntity),
        ).thenAnswer((_) async => expectedResult);
        registerViewModel.firstNameController.text = "fake-firstName";
        registerViewModel.lastNameController.text = "fake-lastName";
        registerViewModel.emailController.text = "fake-email";
        registerViewModel.passwordController.text = "fake-password";
        registerViewModel.confirmPasswordController.text = "fake-repassword";
        registerViewModel.phoneNumberController.text = "fake-phone";
        registerViewModel.selectedGender = Gender.male;
        return registerViewModel.doIntent(OnSignUpClickEvent());
      },
      expect: () => [
        state.copyWith(isLoading: true),
        state.copyWith(isLoading: false, data: expectedEntity),
      ],
      verify: (_) {
        verify(mockedRegisterUseCase.call(registerRequestEntity)).called(1);
      },
    );

    blocTest<RegisterViewModel, RegisterStates>(
      "call doIntent with OnSignUpClickEvent then load and failed",
      build: () => registerViewModel,
      act: (registerViewModel) async {
        when(
          mockedRegisterUseCase.call(registerRequestEntity),
        ).thenAnswer((_) async => expectedError);
        registerViewModel.firstNameController.text = "fake-firstName";
        registerViewModel.lastNameController.text = "fake-lastName";
        registerViewModel.emailController.text = "fake-email";
        registerViewModel.passwordController.text = "fake-password";
        registerViewModel.confirmPasswordController.text = "fake-repassword";
        registerViewModel.phoneNumberController.text = "fake-phone";
        registerViewModel.selectedGender = Gender.male;
        return registerViewModel.doIntent(OnSignUpClickEvent());
      },
      expect: () => [
        state.copyWith(isLoading: true),
        state.copyWith(isLoading: false, errorMessage: errorMsg),
      ],
      verify: (_) {
        verify(mockedRegisterUseCase.call(registerRequestEntity)).called(1);
      },
    );
  });
}
