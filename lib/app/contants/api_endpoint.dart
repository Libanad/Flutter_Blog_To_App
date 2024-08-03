class ApiEndPoints {
  ApiEndPoints._();
  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // static const String baseUrl = "http:// 10.12.19.247:5000/api/";

  static const String baseUrl = 'http://10.0.2.2:5000/api/';
  static const String imageUrl = 'http://10.0.2.2:5000/images/';
 

  // static const String baseUrl = 'http://10.0.2.2:5000/api/';

 
  // --------------------------Auth Routes--------------------------
  static const String loginUser = "$baseUrl/auth/login";
  static const String registerUser = "$baseUrl/auth/register";
  static const String getAllBlogPosts = '$baseUrl/blog/posts';
  static const String createBlogPost = '$baseUrl/blog/posts';
  static const String deleteBlogPost = '$baseUrl/blog/posts';

}