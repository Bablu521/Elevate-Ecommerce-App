import 'package:elevate_ecommerce_app/api/models/responses/auth/profile/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('when call Userdto with null value return user Dto with null value', () {
    // TODO: Implement test
    UserDto userDto=UserDto(
      wishlist: null,
      photo: null,
      gender: null,
      addresses: null,
      email: null,
      firstName: null,
      lastName: null,
      phone: null,
      password: null,
      role: null,
      createdAt: null,
      Id: null,
    );
    var result = userDto.toUserEntity();
    expect(result.Id, null);
    expect(result.createdAt, null);
    expect(result.role, null);
    expect(result.addresses, null);
    expect(result.password, null);
    expect(result.firstName, null);
    expect(result.lastName, null);
    expect(result.email, null);
    expect(result.phone, null);
    expect(result.photo, null);
    expect(result.wishlist, null);
    expect(result.gender, null);
  });

  test('when call Userdto with non_null value return user Dto with right value', () {
    // TODO: Implement test
    UserDto userDto=UserDto(
      wishlist: [],
      photo: "asdasdsadsadasdsad",
      gender: "male",
      addresses: [],
      email: "mo.@gmail.com",
      firstName: "mo",
      lastName: "naeem",
      phone: "01194736212",
      password: "123334444",
      role: "null",
      createdAt: "null",
      Id: "129067342",
    );
    var result = userDto.toUserEntity();
    expect(result.Id, equals(userDto.Id));
    expect(result.createdAt, equals(userDto.createdAt));
    expect(result.role, equals(userDto.role));
    expect(result.addresses, equals(userDto.addresses));
    expect(result.password, equals(userDto.password));
    expect(result.firstName, equals(userDto.firstName));
    expect(result.lastName, equals(userDto.lastName));
    expect(result.email, equals(userDto.email));
    expect(result.phone, equals(userDto.phone));
    expect(result.photo, equals(userDto.photo));
    expect(result.wishlist, equals(userDto.wishlist));
    expect(result.gender, equals(userDto.gender));
  });

}