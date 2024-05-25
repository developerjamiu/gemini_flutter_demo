import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gemini_flutter_demo/views/gemini_demo_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

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
