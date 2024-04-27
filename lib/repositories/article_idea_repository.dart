import 'package:google_generative_ai/google_generative_ai.dart';

class ArticleIdeaRepository {
  /// Inject this dependency in a real app
  /// The key should be hidden in a real app
  final model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: 'api-key',
  );

  /// This should be properly constructed in a real app
  final initialPrompt =
      "Return a 5 list of article ideas with the following rules and payload. If seoEnabled is true in the payload, make the list seo optimized. Return only the list without any title or description and without any form of numbering or formatting; just plain text.";

  Future<List<String>> fetchArticleIdeas({
    required String query,
    bool seoEnabled = false,
  }) async {
    try {
      final prompt =
          '$initialPrompt payload: {query: $query, seoEnabled: $seoEnabled}. ';

      final response = await model.generateContent(
        [Content.text(prompt)],
      );

      if (response.text == null) return [];

      final List<String> splitResult = (response.text as String).split('\n');

      return splitResult.map((result) => result.replaceAll('- ', '')).toList();
    } catch (ex) {
      /// In a real app, you'll handle all possible errors
      return [];
    }
  }
}
