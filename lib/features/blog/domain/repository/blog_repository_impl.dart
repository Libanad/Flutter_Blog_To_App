// ignore_for_file: unnecessary_null_comparison

import 'package:blog_app/core/failure/failure.dart';
import 'package:blog_app/features/blog/data/data_source/remote/blog_remote_data_source.dart';
import 'package:blog_app/features/blog/data/model/blog_api_model.dart';
import 'package:blog_app/features/blog/data/model/blog_hive_model.dart';
import 'package:blog_app/features/blog/domain/repository/blog_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

class BlogPostRepositoryImpl implements BlogPostRepository {
  final BlogPostRemoteDataSource _remoteDataSource;
  final Box<BlogPostHiveModel> _localDataSource;

  BlogPostRepositoryImpl(this._remoteDataSource, this._localDataSource);

  // @override
  // Future<Either<Failure, BlogPostModel>> createBlogPost(BlogPostModel blogPost) async {
  //   try {
  //     // Call the remote data source to create the blog post
  //     final remoteBlogPost = await _remoteDataSource.createBlogPost(blogPost);

  //     // Ensure the remoteBlogPost is not null
  //     if (remoteBlogPost == null) {
  //       return Left(Failure(error: 'Failed to create blog post'));
  //     }

  //     // Save the blog post to the local data source (Hive)
  //     final blogPostHiveModel = BlogPostHiveModel(
  //       id: remoteBlogPost.id,
  //       title: remoteBlogPost.title ?? '',
  //       desc: remoteBlogPost.desc ?? '',
  //       photo: remoteBlogPost.photo,
  //       username: remoteBlogPost.username ?? '',
  //       userId: remoteBlogPost.userId ?? '',
  //       categories: remoteBlogPost.categories ?? [],
  //       createdAt: remoteBlogPost.createdAt ?? DateTime.now().toIso8601String(),
  //       updatedAt: remoteBlogPost.updatedAt ?? DateTime.now().toIso8601String(),
  //     );
  //     await _localDataSource.put(blogPostHiveModel.id, blogPostHiveModel);

  //     return Right(remoteBlogPost);
  //   } catch (e) {
  //     print('Exception caught: ${e.toString()}');
  //     return Left(Failure(error: 'Failed to create blog post: ${e.toString()}'));
  //   }
  // }
@override
Future<Either<Failure, BlogPostModel>> createBlogPost(BlogPostModel blogPost) async {
  try {
    // Call the remote data source to create the blog post
    final remoteBlogPost = await _remoteDataSource.createBlogPost(blogPost);

    // Ensure the remoteBlogPost is not null
    if (remoteBlogPost == null) {
      return Left(Failure(error: 'Failed to create blog post'));
    }

    // Ensure id is of type int
    final String blogPostId = remoteBlogPost.id.toString();

    // Save the blog post to the local data source (Hive)
    final blogPostHiveModel = BlogPostHiveModel(
      id: blogPostId,
      title: remoteBlogPost.title ?? '',
      desc: remoteBlogPost.desc ?? '',
      photo: remoteBlogPost.photo,
      username: remoteBlogPost.username ?? '',
      userId: remoteBlogPost.userId ?? '',
      categories: remoteBlogPost.categories ?? [],
      createdAt: remoteBlogPost.createdAt ?? DateTime.now().toIso8601String(),
      updatedAt: remoteBlogPost.updatedAt ?? DateTime.now().toIso8601String(),
    );

    // await _localDataSource.put(blogPostHiveModel.id, blogPostHiveModel);

    return Right(remoteBlogPost);
  } catch (e) {
    print('Exception caught: ${e.toString()}');
    return Left(Failure(error: 'Failed to create blog post: ${e.toString()}'));
  }
}


  @override
  Future<Either<Failure, void>> deleteBlogPost(String id) async {
    try {
      // Call the remote data source to delete the blog post
      await _remoteDataSource.deleteBlogPost(id);

      // Delete the blog post from the local data source (Hive)
      await _localDataSource.delete(id);

      return const Right(null);
    } catch (e) {
      print('Exception caught: ${e.toString()}');
      return Left(Failure(error: 'Failed to delete blog post: ${e.toString()}'));
    }
  }
  @override
Future<Either<Failure, List<BlogPostModel>>> getAllBlogPosts() async {
  try {
    // Attempt to fetch from the remote data source
    final remoteBlogPosts = await _remoteDataSource.fetchAllBlogPosts();

    if (remoteBlogPosts != null) {
      // Save remote blog posts to local data source (Hive)
      final localBlogPosts = remoteBlogPosts.map((model) {
        return BlogPostHiveModel(
          id: model.id ?? '',
          title: model.title ?? '',
          desc: model.desc ?? '',
          photo: model.photo,
          username: model.username ?? '',
          userId: model.userId ?? '',
          categories: model.categories ?? [],
          createdAt: model.createdAt ?? DateTime.now().toIso8601String(),
          updatedAt: model.updatedAt ?? DateTime.now().toIso8601String(),
        );
      }).toList();

      await Future.wait(localBlogPosts.map((blogPost) => _localDataSource.put(blogPost.id, blogPost)));

      return Right(remoteBlogPosts);
    } else {
      // If remote data is unavailable, fetch from local data source
      final localBlogPosts = _localDataSource.values.toList();
      final blogPosts = localBlogPosts.map((model) {
        return BlogPostModel(
          id: model.id,
          title: model.title,
          desc: model.desc,
          photo: model.photo,
          username: model.username,
          userId: model.userId,
          categories: model.categories,
          createdAt: DateTime.parse(model.createdAt),
          updatedAt: DateTime.parse(model.updatedAt),
        );
      }).toList();
      return Right(blogPosts);
    }
  } catch (e) {
    print('Exception caught: ${e.toString()}');
    return Left(Failure(error: 'Failed to fetch blog posts: ${e.toString()}'));
  }
}


  // @override
  // Future<Either<Failure, List<BlogPostModel>>> getAllBlogPosts() async {
  //   try {
  //     // Fetch the blog posts from the remote data source
  //     final remoteBlogPosts = await _remoteDataSource.fetchAllBlogPosts();

  //     // Ensure remoteBlogPosts is not null and is a list
  //     if (remoteBlogPosts == null) {
  //       return Left(Failure(error: 'Received null response from the server'));
  //     }

  //     // Save remote blog posts to local data source (Hive)
  //     final localBlogPosts = remoteBlogPosts.map((model) {
  //       return BlogPostHiveModel(
  //         id: model.id ?? '', // Handle potential null values
  //         title: model.title ?? '',
  //         desc: model.desc ?? '',
  //         photo: model.photo,
  //         username: model.username ?? '',
  //         userId: model.userId ?? '',
  //         categories: model.categories ?? [],
  //         createdAt: model.createdAt ?? DateTime.now().toIso8601String(),
  //         updatedAt: model.updatedAt ?? DateTime.now().toIso8601String(),
  //       );
  //     }).toList();

  //     await Future.wait(localBlogPosts.map((blogPost) => _localDataSource.put(blogPost.id, blogPost)));

  //     return Right(remoteBlogPosts);
  //   } catch (e) {
  //     print('Exception caught: ${e.toString()}');
  //     return Left(Failure(error: 'Failed to fetch blog posts: ${e.toString()}'));
  //   }
  // }

  @override
  Future<Either<Failure, BlogPostModel>> getBlogPostById(String id) async {
    try {
      // Try to fetch the blog post from local data source (Hive)
      final localBlogPost = _localDataSource.get(id);
      
      if (localBlogPost != null) {
        // Return local blog post if available
        return Right(BlogPostModel(
          id: localBlogPost.id,
          title: localBlogPost.title,
          desc: localBlogPost.desc,
          photo: localBlogPost.photo,
          username: localBlogPost.username,
          userId: localBlogPost.userId,
          categories: localBlogPost.categories,
          createdAt: DateTime.parse(localBlogPost.createdAt),
          updatedAt: DateTime.parse(localBlogPost.updatedAt),
        ));
      }

      // If not found locally, fetch from remote data source
      final remoteBlogPost = await _remoteDataSource.fetchBlogPostById(id);
      if (remoteBlogPost == null) {
        return Left(Failure(error: 'Blog post not found'));
      }

      // Save remote blog post to local data source (Hive)
      final blogPostHiveModel = BlogPostHiveModel(
        id: remoteBlogPost.id ?? '',
        title: remoteBlogPost.title ?? '',
        desc: remoteBlogPost.desc ?? '',
        photo: remoteBlogPost.photo,
        username: remoteBlogPost.username ?? '',
        userId: remoteBlogPost.userId ?? '',
        categories: remoteBlogPost.categories ?? [],
        createdAt: remoteBlogPost.createdAt ?? DateTime.now().toIso8601String(),
        updatedAt: remoteBlogPost.updatedAt ?? DateTime.now().toIso8601String(),
      );
      await _localDataSource.put(blogPostHiveModel.id, blogPostHiveModel);

      return Right(remoteBlogPost);
    } catch (e) {
      return Left(Failure(error: 'Failed to fetch blog post: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, BlogPostModel>> updateBlogPost(BlogPostModel blogPost) async {
    try {
      // Call the remote data source to update the blog post
      final updatedBlogPost = await _remoteDataSource.updateBlogPost(blogPost);
      
      if (updatedBlogPost == null) {
        return Left(Failure(error: 'Failed to update blog post'));
      }

      // Save updated blog post to the local data source (Hive)
      final blogPostHiveModel = BlogPostHiveModel(
        id: updatedBlogPost.id ?? '',
        title: updatedBlogPost.title ?? '',
        desc: updatedBlogPost.desc ?? '',
        photo: updatedBlogPost.photo,
        username: updatedBlogPost.username ?? '',
        userId: updatedBlogPost.userId ?? '',
        categories: updatedBlogPost.categories ?? [],
        createdAt: updatedBlogPost.createdAt ?? DateTime.now().toIso8601String(),
        updatedAt: updatedBlogPost.updatedAt ?? DateTime.now().toIso8601String(),
      );
      await _localDataSource.put(blogPostHiveModel.id, blogPostHiveModel);

      return Right(updatedBlogPost);
    } catch (e) {
      return Left(Failure(error: 'Failed to update blog post: ${e.toString()}'));
    }
  }
}
