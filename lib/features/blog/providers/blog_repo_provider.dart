import 'package:blog_app/app/contants/api_endpoint.dart';
import 'package:blog_app/core/failure/failure.dart';
import 'package:blog_app/features/blog/data/model/blog_api_model.dart';
import 'package:blog_app/features/blog/domain/repository/blog_repository.dart';
import 'package:blog_app/features/blog/domain/usecases/blog_usecasew.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:blog_app/features/blog/data/data_source/remote/blog_remote_data_source.dart';
import 'package:blog_app/features/blog/data/model/blog_hive_model.dart';
import 'package:blog_app/features/blog/domain/repository/blog_repository_impl.dart';

final blogPostBoxProvider = Provider<Box<BlogPostHiveModel>>((ref) {
  
  return Hive.box<BlogPostHiveModel>('blogPosts');
});
final blogPostsProvider = FutureProvider<Either<Failure, List<BlogPost>>>((ref) async {
  final repository = ref.watch(blogPostRepositoryProvider);
  return repository.getAllBlogPosts();
});

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(); // Initialize Dio instance
  dio.options.baseUrl = ApiEndPoints.baseUrl;
  return dio;
});
final blogPostRemoteDataSourceProvider = Provider<BlogPostRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider); // Assuming dioProvider is defined elsewhere
  return BlogPostRemoteDataSource(dio);
});

final blogPostRepositoryProvider = Provider<BlogPostRepository>((ref) {
  final box = ref.watch(blogPostBoxProvider);
  final remoteDataSource = ref.watch(blogPostRemoteDataSourceProvider);
  return BlogPostRepositoryImpl(remoteDataSource, box);
});

final getAllBlogPostsUseCaseProvider = Provider<GetAllBlogPostsUseCase>((ref) {
  final repository = ref.watch(blogPostRepositoryProvider);
  return GetAllBlogPostsUseCase(repository: repository);
});

final getBlogPostByIdUseCaseProvider = Provider<GetBlogPostByIdUseCase>((ref) {
  final repository = ref.watch(blogPostRepositoryProvider);
  return GetBlogPostByIdUseCase(repository: repository);
});

final createBlogPostUseCaseProvider = Provider<CreateBlogPostUseCase>((ref) {
  final repository = ref.watch(blogPostRepositoryProvider);
  return CreateBlogPostUseCase(repository: repository);
});

final updateBlogPostUseCaseProvider = Provider<UpdateBlogPostUseCase>((ref) {
  final repository = ref.watch(blogPostRepositoryProvider);
  return UpdateBlogPostUseCase(repository: repository);
});

final deleteBlogPostUseCaseProvider = Provider<DeleteBlogPostUseCase>((ref) {
  final repository = ref.watch(blogPostRepositoryProvider);
  return DeleteBlogPostUseCase(repository: repository);
});
