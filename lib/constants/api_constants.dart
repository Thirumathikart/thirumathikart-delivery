class ApiConstants {
  static String baseUrl = 'https://thirumathikart.nitt.edu/api/auth';
  static String login = '$baseUrl/api/user/loginCustomer';
  static String forgotPassword= '$baseUrl/api/user/forgotPassword';
  static String register = '$baseUrl/api/user/signup';
  static String fetchProduct =
      'https://thirumathikart.nitt.edu/api/order/fetch_by_customer';
  static String orderBaseUrl = 'https://thirumathikart.nitt.edu/api/product';
}
