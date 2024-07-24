class BlogPostModel {
  final String id;
  final String title;
  final String desc;
  final String? photo;
  final String username;
  final String userId;
  final List<String> categories;
  final String createdAt;
  final String updatedAt;

  BlogPostModel({
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

  factory BlogPostModel.fromJson(Map<String, dynamic> json) {
    return BlogPostModel(
      id: json['id'] ?? '', // Handle potential null
      title: json['title'] ?? '',
      desc: json['desc'] ?? '',
      photo: json['photo'],
      username: json['username'] ?? '',
      userId: json['userId'] ?? '',
      categories: List<String>.from(json['categories'] ?? []),
      createdAt: json['createdAt'] ?? DateTime.now().toIso8601String(),
      updatedAt: json['updatedAt'] ?? DateTime.now().toIso8601String(),
    );
  }
}