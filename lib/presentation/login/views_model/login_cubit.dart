import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elevate_ecommerce_app/presentation/login/views_model/login_state.dart';
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
}
