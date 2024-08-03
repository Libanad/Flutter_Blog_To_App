class BlogPost {
  final String id;
  final String title;
  final String desc;
  final String? photo;
  final String username;
  final String userId;
  final List<String> categories;
  final String createdAt;
  final String updatedAt;

  BlogPost({
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
}

class BlogPostModel extends BlogPost {
  BlogPostModel({
    String? id,
    required super.title,
    required super.desc,
    super.photo,
    required super.username,
    required super.userId,
    required super.categories,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
          id: id ?? '',
          createdAt: createdAt.toIso8601String(),
          updatedAt: updatedAt.toIso8601String(),
        );

  factory BlogPostModel.fromJson(Map<String, dynamic> json) {
    return BlogPostModel(
      id: json['_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      desc: json['desc'] as String? ?? '',
      photo: json['photo'] as String?,
      username: json['username'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      categories: List<String>.from(json['categories'] ?? []),
      createdAt: DateTime.tryParse(json['createdAt'] as String? ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] as String? ?? '') ?? DateTime.now(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'desc': desc,
      'photo': photo,
      'username': username,
      'userId': userId,
      'categories': categories,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
