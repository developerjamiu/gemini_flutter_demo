import 'package:gemini_flutter_demo/models/article_idea.dart';

/// Declare Model
///
/// Engineer Prompt
///
/// Parse Response
///
/// Return Response
class ArticleIdeaRepository {
  Future<List<ArticleIdea>> fetchArticleIdeas({
    required String query,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return List.generate(
        10,
        (index) => ArticleIdea(
          title: 'Article Idea $index',
          description: 'description$index',
        ),
      );
    } catch (ex) {
      /// In a real app, you'll handle all possible errors
      return [];
    }
  }
}
