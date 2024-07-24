import 'package:dio/dio.dart';
import 'package:blog_app/features/blog/data/model/blog_api_model.dart';

class BlogPostRemoteDataSource {
  final Dio _dio;

  BlogPostRemoteDataSource(this._dio);

  // Fetch all blog posts
  Future<List<BlogPostModel>> fetchAllBlogPosts() async {
    try {
      final response = await _dio.get('posts'); // Replace with your endpoint
      final List<dynamic> data = response.data;
      return data.map((json) => BlogPostModel.fromJson(json)).toList();
    } on DioError catch (e) {
      throw Exception('Failed to load blog posts: ${e.message}');
    }
  }

  // Fetch a single blog post by ID
  Future<BlogPostModel> fetchBlogPostById(String id) async {
    try {
      final response = await _dio.get('/posts/$id'); // Replace with your endpoint
      return BlogPostModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Failed to load blog post: ${e.message}');
    }
  }

  // Create a new blog post
  Future<BlogPostModel> createBlogPost(BlogPostModel blogPost) async {
    try {
      final response = await _dio.post(
        '/blogposts', // Replace with your endpoint
        data: blogPost.toJson(),
      );
      return BlogPostModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Failed to create blog post: ${e.message}');
    }
  }

  // Update an existing blog post
  Future<BlogPostModel> updateBlogPost(BlogPostModel blogPost) async {
    try {
      final response = await _dio.put(
        '/blogposts/${blogPost.id}', // Replace with your endpoint
        data: blogPost.toJson(),
      );
      return BlogPostModel.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception('Failed to update blog post: ${e.message}');
    }
  }

  // Delete a blog post
  Future<void> deleteBlogPost(String id) async {
    try {
      await _dio.delete('/blogposts/$id'); // Replace with your endpoint
    } on DioError catch (e) {
      throw Exception('Failed to delete blog post: ${e.message}');
    }
  }
}
