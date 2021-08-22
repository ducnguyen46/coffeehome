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
  static const String order = baseUrl + "/order";
  static const String orderReceived = baseUrl + "/order-received";

  //items
  static const String items = baseUrl + "/items";

  //bill
  static const String bill = baseUrl + "/bill";
  static const String bill_ongoing = baseUrl + "/bill/on-going";
  static const String bill_complete = baseUrl + "/bill/complete";

  //delivery
  static const String deliveryInfo = baseUrl + "/delivery-info";
}
