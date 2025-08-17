abstract final class AppText {
  // Validations
  static const String userNameValidation = "This user name is not valid";
  static const String phoneNumberValidation = "Phone number field is required";
  static const String phoneNumberValidation2 =
      "Phone Number should consist of 11 digits";
  static const String emailValidation = "Email field is required";
  static const String emailValidation2 = "Enter a valid email";
  static const String passwordValidation = "Password field is required";
  static const String passwordValidation2 =
      "Password field should contain at least 8 characters";
  static const String confirmPasswordValidation =
      "Confirm password field is required";
  static const String confirmPasswordValidation2 =
      "Password does not match, please check the entered password";
  static const String passwordValidation3 = "Password cannot contain spaces";
  static const String passwordValidation4 =
      "Password must contain at least one number";
  static const String passwordValidation5 =
      "Password must not exceed 20 characters";

  //Exceptions
  static const String noResponseReceivedMessage =
      "No response received or response is not in expected format.";
  static const String error = "Error";
  static const String unexpectedError = "Unexpected error:";
  static const String unexpectedErrorOccurred = "Unexpected error occurred.";
  static const String requestCancelled = "Request was cancelled.";
  static const String receiveTimeout =
      "Receive timeout, please try again later.";
  static const String sendTimeout = "Send timeout, please try again later.";
  static const String connectionTimeout =
      "Connection timeout, please try again later.";
  static const String networkError =
      "Something went wrong. Please check your internet connection.";
  static const String anUnknownErrorOccurred = "An unknown error occurred.";
  static const String internalServerError =
      "Internal server error, try again later.";
  static const String validationError = "Validation Error.";
  static const String resourceNotFound = "Resource not found.";
  static const String forbidden = "Forbidden, you do not have permission.";
  static const String unauthorized =
      "Unauthorized, please check your credentials.";
  static const String badRequest = "Bad request, please check your input.";
  static const String manyRequests = "Too Many Requests";
}
