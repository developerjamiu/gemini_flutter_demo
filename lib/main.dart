import 'package:flutter/material.dart';
import 'package:gemini_flutter_demo/views/gemini_demo_view.dart';

void main() {
  runApp(const GeminiDemo());
}

class GeminiDemo extends StatelessWidget {
  const GeminiDemo({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Article Idea Generator';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GeminiDemoView(title: title),
    );
  }
}
