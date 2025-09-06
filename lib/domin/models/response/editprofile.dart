

import 'package:elevate_ecommerce_app/domin/models/response/user.dart';
import 'package:equatable/equatable.dart';

class EditProfileEntity extends Equatable {
  final String? message;
  final UserEntity? user;

   EditProfileEntity ({
    this.message,
    this.user,
  });

  @override
  List<Object?> get props =>[message,user];

  @override
  bool? get stringify => true;


}




