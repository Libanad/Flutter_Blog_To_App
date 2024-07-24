import 'package:blog_app/core/failure/failure.dart';
import 'package:blog_app/features/blog/data/model/blog_api_model.dart';
import 'package:dartz/dartz.dart';
import 'package:blog_app/features/blog/domain/repository/blog_repository.dart';

class GetAllBlogPostsUseCase {
  final BlogPostRepository repository;

  GetAllBlogPostsUseCase({required this.repository});

  Future<Either<Failure, List<BlogPost>>> call() async {
    return await repository.getAllBlogPosts();
  }
}

class GetBlogPostByIdUseCase {
  final BlogPostRepository repository;

  GetBlogPostByIdUseCase({required this.repository});

  Future<Either<Failure, BlogPost>> call(String id) async {
    return await repository.getBlogPostById(id);
  }
}

class CreateBlogPostUseCase {
  final BlogPostRepository repository;

  CreateBlogPostUseCase({required this.repository});

  Future<Either<Failure, BlogPost>> call(BlogPostModel blogPost) async {
    return await repository.createBlogPost(blogPost);
  }
}

class UpdateBlogPostUseCase {
  final BlogPostRepository repository;

  UpdateBlogPostUseCase({required this.repository});

  Future<Either<Failure, BlogPost>> call(BlogPostModel blogPost) async {
    return await repository.updateBlogPost(blogPost);
  }
}

class DeleteBlogPostUseCase {
  final BlogPostRepository repository;

  DeleteBlogPostUseCase({required this.repository});

  Future<Either<Failure, void>> call(String id) async {
    return await repository.deleteBlogPost(id);
  }
}
