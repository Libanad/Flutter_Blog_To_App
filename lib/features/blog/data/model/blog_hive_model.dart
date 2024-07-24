// lib/data/models/blog_post_model.dart

import 'package:blog_app/features/blog/data/model/blog_api_model.dart';
import 'package:hive/hive.dart';

part 'blog_hive_model.g.dart';

@HiveType(typeId: 0)
class BlogPostHiveModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String desc;

  @HiveField(3)
  final String? photo;

  @HiveField(4)
  final String username;

  @HiveField(5)
  final String userId;

  @HiveField(6)
  final List<String> categories;

  @HiveField(7)
  final String createdAt;

  @HiveField(8)
  final String updatedAt;

  BlogPostHiveModel({
    required this.id,
    required this.title,
    required this.desc,
    this.photo,
    required this.username,
    required this.userId,
    required this.categories,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BlogPostHiveModel.fromEntity(BlogPost blogPost) {
    return BlogPostHiveModel(
      id: blogPost.id,
      title: blogPost.title,
      desc: blogPost.desc,
      photo: blogPost.photo,
      username: blogPost.username,
      userId: blogPost.userId,
      categories: blogPost.categories,
      createdAt: blogPost.createdAt,
      updatedAt: blogPost.updatedAt,
    );
  }

  BlogPost toEntity() {
    return BlogPost(
      id: id,
      title: title,
      desc: desc,
      photo: photo,
      username: username,
      userId: userId,
      categories: categories,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
