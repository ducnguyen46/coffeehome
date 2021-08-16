class Api {
  static const String baseUrl = "http://localhost:8080/api";

  //user
  static const String login = baseUrl + "/login";
  static const String register = baseUrl + "/register";
  static const String changePassword = baseUrl + "/user/changePassword";
  static const String userInfo = baseUrl + "/user/info";

  //product
  static const String getAllProducts = baseUrl + "/products";
  static const String getProductId = baseUrl + "product/{id}";

  //order
  static const String orders = baseUrl + "/order";

  //delivery
  static const String deliveryInfo = baseUrl + "/delivery-info";
}
