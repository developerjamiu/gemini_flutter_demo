import 'package:flutter/material.dart';

class GeminiDemoLoadingView extends StatelessWidget {
  const GeminiDemoLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
