class Api {
  static final String baseUrl = "http://localhost:8080/api";

  //user
  static final String login = baseUrl + "/login";
  static final String register = baseUrl + "/register";
  static final String changePassword = baseUrl + "/user/changePassword";
  static final String userInfo = baseUrl + "/user/info";

  //product
  static final String getAllProducts = baseUrl + "/products";
  static final String getProductId = baseUrl + "product/{id}";

  //order
  static final String orders = baseUrl + "/order";
}
