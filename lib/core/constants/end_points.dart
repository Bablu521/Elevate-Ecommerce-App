abstract class Endpoints {
  static const String register = "api/v1/auth/signup";
  static const String editProfile = "api/v1/auth/editProfile";
  static const String signIn = "api/v1/auth/signin";
  static const String changePassword = "api/v1/auth/change-password";
  static const String profileData = "api/v1/auth/profile-data";
  static const String editProfileData = "api/v1/auth/editProfile";
  static const String uploadProfileImage = "api/v1/auth/upload-photo";
  static const String forgetPassword = "api/v1/auth/forgotPassword";
  static const String verifyReset = "api/v1/auth/verifyResetCode";
  static const String resetPassword = "api/v1/auth/resetPassword";
  static const String occasions = "api/v1/occasions";
  static const String categories = "api/v1/categories";
  static const String products = "api/v1/products";
  static const String categoryQuery = "category";
  static const String occasionQuery = "occasion";
  static const String bestSeller = "api/v1/best-seller";
  static const String cart = "api/v1/cart";
  static const String address = "api/v1/addresses";
  static const String logout = "api/v1/auth/logout";
  static const String getOrders = "api/v1/orders";
  static const String checkoutCashOrder = "api/v1/orders";
  static const String checkoutCreditOrder = "api/v1/orders/checkout?url=http://localhost:3000";
}
