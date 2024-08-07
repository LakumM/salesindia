class UrlHelper {
  ///Base URL
  static const String Base_URL = "https://www.marketcraft.in/ecommerce-api";

  /// User URL
  static const String Login_User_URL = "$Base_URL/user/login";
  static const String Register_User_URL = "$Base_URL/user/registration";
  static const String Profile_URl = "$Base_URL/user/profile";

  /// Product URL
  static const String Categories_URl = "$Base_URL/categories";
  static const String Products_URl = "$Base_URL/products";
  static const String Add_To_cart = "$Base_URL/add-to-card";
  static const String View_Cart_URl = "$Base_URL/product/view-cart";
  static const String Delete_CartItem_URl = "$Base_URL/product/delete-cart";
}
