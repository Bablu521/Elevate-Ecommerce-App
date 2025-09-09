@GenerateMocks([AuthRemoteDataSource])
void main() {
  group('test AuthRepoImpl', () {
    late MockAuthRemoteDataSource mockAuthRemoteDataSource;
    late AuthRepoImpl authRepoImpl;

    setUp(() {
      mockAuthRemoteDataSource = MockAuthRemoteDataSource();
      authRepoImpl = AuthRepoImpl(mockAuthRemoteDataSource);
    });

    group("test forgetPassword", () {
      late ForgetPasswordRequestEntity forgetPasswordRequestEntity;

      setUp((){
        forgetPasswordRequestEntity = ForgetPasswordRequestEntity(
          email: "fake-email",
        );
      });

      test("when call forgetPassword it should return ForgetPasswordEntity from data source with right parameters", () async {
        //Arrange
        var expectedEntity = ForgetPasswordEntity(
          message: "fake-message",
          info: "fake-info",
        );
        var expectedResult = ApiSuccessResult<ForgetPasswordEntity>(expectedEntity);
        provideDummy<ApiResult<ForgetPasswordEntity>>(expectedResult);
        when(
          mockAuthRemoteDataSource.forgetPassword(forgetPasswordRequestEntity),
        ).thenAnswer((_) async => expectedResult);
        //Act
        var result = await authRepoImpl.forgetPassword(forgetPasswordRequestEntity);
        //Assert
        verify(
          mockAuthRemoteDataSource.forgetPassword(forgetPasswordRequestEntity),
        ).called(1);
        expect(result, isA<ApiSuccessResult<ForgetPasswordEntity>>());
        result as ApiSuccessResult<ForgetPasswordEntity>;
        expect(result.data.info, equals(expectedEntity.info));
        expect(result.data.message, equals(expectedEntity.message));
      });

      test("when forgetPassword failed it should return an error result", () async {
        //Arrange
        var expectedError = "Server Error";
        var expectedResult = ApiErrorResult<ForgetPasswordEntity>(expectedError);
        provideDummy<ApiResult<ForgetPasswordEntity>>(expectedResult);
        when(
          mockAuthRemoteDataSource.forgetPassword(forgetPasswordRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Call
        var result = await authRepoImpl.forgetPassword(forgetPasswordRequestEntity);

        //Assert
        verify(
          mockAuthRemoteDataSource.forgetPassword(forgetPasswordRequestEntity),
        ).called(1);
        expect(result, isA<ApiErrorResult<ForgetPasswordEntity>>());
        result as ApiErrorResult<ForgetPasswordEntity>;
        expect(result.errorMessage, expectedError);
      });

    });

    group("test verifyResetCode", () {
      late VerifyResetRequestEntity verifyResetRequestEntity;

      setUp((){
        verifyResetRequestEntity = VerifyResetRequestEntity(
          resetCode: "fake-reset-code",
        );
      });

      test("when call verifyResetCode it should return VerifyResetEntity from data source with right parameters", () async {
        //Arrange
        var expectedEntity = VerifyResetEntity(
          status: "fake-status",
        );
        var expectedResult = ApiSuccessResult<VerifyResetEntity>(expectedEntity);
        provideDummy<ApiResult<VerifyResetEntity>>(expectedResult);
        when(
          mockAuthRemoteDataSource.verifyResetCode(verifyResetRequestEntity),
        ).thenAnswer((_) async => expectedResult);
        //Act
        var result = await authRepoImpl.verifyResetCode(verifyResetRequestEntity);
        //Assert
        verify(
          mockAuthRemoteDataSource.verifyResetCode(verifyResetRequestEntity),
        ).called(1);
        expect(result, isA<ApiSuccessResult<VerifyResetEntity>>());
        result as ApiSuccessResult<VerifyResetEntity>;
        expect(result.data.status, equals(expectedEntity.status));
      });

      test("when verifyResetCode failed it should return an error result", () async {
        //Arrange
        var expectedError = "Server Error";
        var expectedResult = ApiErrorResult<VerifyResetEntity>(expectedError);
        provideDummy<ApiResult<VerifyResetEntity>>(expectedResult);
        when(
          mockAuthRemoteDataSource.verifyResetCode(verifyResetRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Call
        var result = await authRepoImpl.verifyResetCode(verifyResetRequestEntity);

        //Assert
        verify(
          mockAuthRemoteDataSource.verifyResetCode(verifyResetRequestEntity),
        ).called(1);
        expect(result, isA<ApiErrorResult<VerifyResetEntity>>());
        result as ApiErrorResult<VerifyResetEntity>;
        expect(result.errorMessage, expectedError);
      });

    });

    group("test resetPassword", () {
      late ResetPasswordRequestEntity resetPasswordRequestEntity;

      setUp((){
        resetPasswordRequestEntity = ResetPasswordRequestEntity(
            email: "fake-email",
            newPassword: "fake-new-password"
        );
      });

      test("when call resetPassword it should return ResetPasswordEntity from data source with right parameters", () async {
        //Arrange
        var expectedEntity = ResetPasswordEntity(
            message: "fake-message",
            token: "fake-token"
        );
        var expectedResult = ApiSuccessResult<ResetPasswordEntity>(expectedEntity);
        provideDummy<ApiResult<ResetPasswordEntity>>(expectedResult);
        when(
          mockAuthRemoteDataSource.resetPassword(resetPasswordRequestEntity),
        ).thenAnswer((_) async => expectedResult);
        //Act
        var result = await authRepoImpl.resetPassword(resetPasswordRequestEntity);
        //Assert
        verify(
          mockAuthRemoteDataSource.resetPassword(resetPasswordRequestEntity),
        ).called(1);
        expect(result, isA<ApiSuccessResult<ResetPasswordEntity>>());
        result as ApiSuccessResult<ResetPasswordEntity>;
        expect(result.data.token, equals(expectedEntity.token));
        expect(result.data.message, equals(expectedEntity.message));
      });

      test("when resetPassword failed it should return an error result", () async {
        //Arrange
        var expectedError = "Server Error";
        var expectedResult = ApiErrorResult<ResetPasswordEntity>(expectedError);
        provideDummy<ApiResult<ResetPasswordEntity>>(expectedResult);
        when(
          mockAuthRemoteDataSource.resetPassword(resetPasswordRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Call
        var result = await authRepoImpl.resetPassword(resetPasswordRequestEntity);

        //Assert
        verify(
          mockAuthRemoteDataSource.resetPassword(resetPasswordRequestEntity),
        ).called(1);
        expect(result, isA<ApiErrorResult<ResetPasswordEntity>>());
        result as ApiErrorResult<ResetPasswordEntity>;
        expect(result.errorMessage, expectedError);
      });

    });

  });
  group('test AuthRepoImpl', () {
    late MockAuthRemoteDataSource mockedAuthRemoteDataSource;
    late MockAuthLocalDataSource mockedAuthLocalDataSource;
    late AuthRepoImpl authRepoImpl;
    late RegisterRequestEntity registerRequestEntity;
    setUp(() {
      mockedAuthRemoteDataSource =
          MockAuthRemoteDataSource();
      mockedAuthLocalDataSource = MockAuthLocalDataSource();
      authRepoImpl = AuthRepoImpl(
        mockedAuthRemoteDataSource,
        mockedAuthLocalDataSource,
      );
      registerRequestEntity = const RegisterRequestEntity(
        firstName: "fake-firstName",
        lastName: "fake-lastName",
        email: "fake-email",
        password: "fake-password",
        rePassword: "fake-rePassword",
        phone: "fake-phone",
        gender: "fake-gender",
      );
    });
    test(
      'when call register it should return RegisterEntity from data source with right parameters',
          () async {
        //Arrange
        final expectedEntity = const RegisterEntity(
          firstName: "fake-firstName",
          lastName: "fake-lastName",
          email: "fake-email",
          gender: "fake-gender",
          phone: "fake-phone",
          photo: "fake-photo",
          role: "fake-role",
          wishlist: ["fake-wishlist"],
          id: "fake-id",
          addresses: ["fake-addresses"],
        );
        final expectedResult = ApiSuccessResult(expectedEntity);
        provideDummy<ApiResult<RegisterEntity>>(expectedResult);
        when(
          mockedAuthRemoteDataSource.register(registerRequestEntity),
        ).thenAnswer((_) async => expectedResult);

        //Act
        final result = await authRepoImpl.register(registerRequestEntity);

        //Assert
        verify(
          mockedAuthRemoteDataSource.register(registerRequestEntity),
        ).called(1);
        expect(result, isA<ApiSuccessResult<RegisterEntity>>());
        result as ApiSuccessResult<RegisterEntity>;
        expect(result.data, expectedEntity);
      },
    );

    test("when register failed it should return an error result", () async {
      //Arrange
      final expectedError = "Server Error";
      final expectedResult = ApiErrorResult<RegisterEntity>(expectedError);
      provideDummy<ApiResult<RegisterEntity>>(expectedResult);
      when(
        mockedAuthRemoteDataSource.register(registerRequestEntity),
      ).thenAnswer((_) async => expectedResult);

      //Call
      final result = await authRepoImpl.register(registerRequestEntity);

      //Assert
      verify(
        mockedAuthRemoteDataSource.register(registerRequestEntity),
      ).called(1);
      expect(result, isA<ApiErrorResult<RegisterEntity>>());
      result as ApiErrorResult<RegisterEntity>;
      expect(result.errorMessage, expectedError);
    });

    final LoginRequestModel loginRequestModel =
    LoginTestFixtures.fakeLoginRequest();
    test("login success", () async {
      ///Arrange
      final LoginResponseDto loginResponseDto =
      LoginTestFixtures.fakeLoginResponse();
      final LoginEntity loginEntity = const LoginEntity(
        userToken: "fake_token",
        message: "success",
      );
      when(
        mockedAuthRemoteDataSource.login(loginRequest: loginRequestModel),
      ).thenAnswer((_) async => loginResponseDto);

      ///Act
      final result = await authRepoImpl.login(
        loginRequestModel: loginRequestModel,
      );

      ///Assert
      expect(result, isA<ApiSuccessResult<LoginEntity>>());
      verify(
        mockedAuthRemoteDataSource.login(loginRequest: loginRequestModel),
      ).called(1);
      final resultEntity = result as ApiSuccessResult<LoginEntity>;
      expect(resultEntity.data.userToken, loginEntity.userToken);
      verify(
        mockedAuthLocalDataSource.saveUserToken(
          token: resultEntity.data.userToken,
        ),
      ).called(1);
      verify(
        mockedAuthLocalDataSource.saveUserRememberMe(
          rememberMe: loginRequestModel.rememberMe,
        ),
      ).called(1);
    });
    test("login failure dio exception", () async {
      //Arrange
      final dioError = DioException(
        requestOptions: RequestOptions(),
        message: "fake dio error",
      );
      when(
        mockedAuthRemoteDataSource.login(loginRequest: loginRequestModel),
      ).thenThrow(dioError);
      //Act
      final result = await authRepoImpl.login(
        loginRequestModel: loginRequestModel,
      );
      //Assert
      expect(result, isA<ApiErrorResult<LoginEntity>>());
      expect(
        (result as ApiErrorResult<LoginEntity>).errorMessage,
        equals(contains(dioError.message)),
      );
      verifyNever(mockedAuthLocalDataSource.saveUserToken(token: "")).called(0);
      verifyNever(
        mockedAuthLocalDataSource.saveUserRememberMe(
          rememberMe: loginRequestModel.rememberMe,
        ),
      ).called(0);
    });
    test("login failure unknown exception", () async {
      //Arrange
      final exception = Exception("fake unknown exception");
      when(
        mockedAuthRemoteDataSource.login(loginRequest: loginRequestModel),
      ).thenThrow(exception);
      //Act
      final result = await authRepoImpl.login(
        loginRequestModel: loginRequestModel,
      );
      //Assert
      expect(result, isA<ApiErrorResult<LoginEntity>>());
      expect((result as ApiErrorResult<LoginEntity>).error, equals(exception));
      verifyNever(mockedAuthLocalDataSource.saveUserToken(token: "")).called(0);
      verifyNever(
        mockedAuthLocalDataSource.saveUserRememberMe(
          rememberMe: loginRequestModel.rememberMe,
        ),
      ).called(0);});

    test("user status login", () async {
      //Arrange
      const bool expectResult = true;
      //Act
      when(
        mockedAuthLocalDataSource.getUserStatus(),
      ).thenAnswer((_) async => expectResult);
      final bool result = await authRepoImpl.getUserStatus();
      //Assert
      expect(result, isA<bool>());
      expect(result, equals(expectResult));
      verify(mockedAuthLocalDataSource.getUserStatus()).called(1);
    });

  });
}