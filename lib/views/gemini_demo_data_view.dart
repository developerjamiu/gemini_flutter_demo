import 'package:flutter/material.dart';
import 'package:gemini_flutter_demo/models/article_idea.dart';

class GeminiDemoDataView extends StatelessWidget {
  const GeminiDemoDataView({
    super.key,
    required this.articleIdeas,
  });

  final List<ArticleIdea> articleIdeas;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articleIdeas.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          articleIdeas[index].title,
        ),
        subtitle: Text(
          articleIdeas[index].description,
        ),
      ),
    );
  }
}
