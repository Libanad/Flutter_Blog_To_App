class ApiEndPoints {
  ApiEndPoints._();
  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // static const String baseUrl = "http:// 10.12.19.247:5000/api/";

    static const String baseUrl = 'https://4e20-27-34-49-132.ngrok-free.app/api/';
  static const String imageUrl = 'https://4e20-27-34-49-132.ngrok-free.app';

  // static const String baseUrl = 'http://10.0.2.2:5000/api/';

 
  // --------------------------Auth Routes--------------------------
  static const String loginUser = "auth/login";
  static const String registerUser = "auth/register";

  static const String getAllBlogPosts = '$baseUrl/blog/posts';
  static const String createBlogPost = '$baseUrl/blog/posts';
  static const String deleteBlogPost = '$baseUrl/blog/posts';
}