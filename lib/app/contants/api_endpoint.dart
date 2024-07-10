class ApiEndPoints {
  ApiEndPoints._();
  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http:// 10.12.19.247:5000/api/";
  // static const String baseUrl = 'http://192.168.1.7:5000/api/';
 
  // --------------------------Auth Routes--------------------------
  static const String loginUser = "auth/login";
  static const String registerUser = "auth/register";
}