import 'package:elevate_ecommerce_app/api/models/responses/logout/logout_model.dart';
import 'package:elevate_ecommerce_app/domin/entities/logout_entity.dart';

extension LogoutMapper on LogoutModel {
  LogoutEntity toEntity() {
    return LogoutEntity(message: message);
  }
}
