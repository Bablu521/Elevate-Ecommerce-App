import 'package:elevate_ecommerce_app/api/models/requestes/login_requests/login_request.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/login_response_dto.dart';
import 'package:elevate_ecommerce_app/api/models/responses/login_response/user_response_dto.dart';
import 'package:elevate_ecommerce_app/domin/entities/login_entity.dart';

class LoginTestFixtures {
  static LoginRequestModel fakeLoginRequest({
    String email = "test@test.com",
    String password = "123456",
  }) {
    return LoginRequestModel(email: email, password: password);
  }

  static LoginEntity fakeLoginEntity({
    String fakeMessage = "Fake Message",
    String fakeToken = "Fake Token",
  }) {
    return LoginEntity(message: fakeMessage, userToken: fakeToken);
  }

  static LoginResponseDto fakeLoginResponse({String token = "fake_token"}) {
    return LoginResponseDto(
      message: "success",
      user: UserResponseDto(
        firstName: "Moaz",
        lastName: "Osama",
        email: "test@test.com",
        gender: "male",
        phone: "0100000000",
        photo: "default.png",
        role: "user",
        wishlist: [],
        id: "123",
        addresses: [],
        createdAt: "2025-08-20",
      ),
      token: token,
    );
  }
}
