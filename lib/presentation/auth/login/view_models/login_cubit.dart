import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elevate_ecommerce_app/presentation/auth/login/view_models/login_state.dart';
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
}
