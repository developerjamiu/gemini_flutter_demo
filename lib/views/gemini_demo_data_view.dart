import 'package:flutter/material.dart';

class GeminiDemoDataView extends StatelessWidget {
  const GeminiDemoDataView({
    super.key,
    required this.articleIdeas,
  });

  final List<String> articleIdeas;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articleIdeas.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(
          articleIdeas[index],
        ),
      ),
    );
  }
}
