sealed class ForgetPasswordEvents {}

class ForgetPasswordEvent extends ForgetPasswordEvents {
  final bool isResend;
  ForgetPasswordEvent({this.isResend = false});
}
class VerifyResetCodeEvent extends ForgetPasswordEvents {}
class ResetPasswordEvent extends ForgetPasswordEvents {}