import 'package:blog_app/core/failure/failure.dart';
import 'package:blog_app/features/blog/data/model/blog_api_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/scroll_view.dart';


abstract class BlogPostRepository {
  Future<Either<Failure, List<BlogPost>>> getAllBlogPosts();
  Future<Either<Failure, BlogPost>> getBlogPostById(String id);
  Future<Either<Failure, BlogPost>> createBlogPost(BlogPostModel blogPost);
  Future<Either<Failure, BlogPost>> updateBlogPost(BlogPostModel blogPost);
  Future<Either<Failure, void>> deleteBlogPost(String id);

}
