// import 'dart:convert';

// import 'package:firebase_vertexai/firebase_vertexai.dart';
// import 'package:gemini_flutter_demo/models/article_idea.dart';

// class ArticleIdeaRepository {
//   final model = FirebaseVertexAI.instance.generativeModel(
//     model: 'gemini-1.5-flash-preview-0514',
//   );

//   Future<List<ArticleIdea>> fetchArticleIdeas({
//     required String query,
//   }) async {
//     try {
//       final initialPrompt =
//           "Return 10 random article ideas based on the following text: $query. Answer in JSON with the keys title and description";

//       final response = await model.generateContent(
//         [
//           Content.text(initialPrompt),
//         ],
//         generationConfig: GenerationConfig(
//           temperature: 0,
//           responseMimeType: 'application/json',
//         ),
//       );

//       if (response.text == null) return [];

//       final List<dynamic> result = json.decode(response.text!);

//       return result.map((result) => ArticleIdea.fromJson(result)).toList();
//     } catch (ex) {
//       /// In a real app, you'll handle all possible errors
//       return [];
//     }
//   }
// }
