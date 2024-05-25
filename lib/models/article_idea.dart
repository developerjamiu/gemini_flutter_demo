class ArticleIdea {
  final String title;
  final String description;

  ArticleIdea({
    required this.title,
    required this.description,
  });

  factory ArticleIdea.fromJson(Map<String, dynamic> json) {
    return ArticleIdea(
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }
}
