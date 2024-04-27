class ArticleIdeaRepository {
  Future<List<String>> fetchArticleIdeas({
    required String query,
    bool seoEnabled = false,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(10, (index) => 'Article Idea $index');
  }
}
