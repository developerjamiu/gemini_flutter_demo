import 'package:flutter/material.dart';
import 'package:gemini_flutter_demo/repositories/article_idea_repository.dart';
import 'package:gemini_flutter_demo/views/gemini_demo_data_view.dart';
import 'package:gemini_flutter_demo/views/gemini_demo_loading_view.dart';
import 'package:gemini_flutter_demo/widgets/app_text_field.dart';
import 'package:gemini_flutter_demo/widgets/send_button.dart';

class GeminiDemoView extends StatefulWidget {
  const GeminiDemoView({super.key, required this.title});

  final String title;

  @override
  State<GeminiDemoView> createState() => _GeminiDemoViewState();
}

class _GeminiDemoViewState extends State<GeminiDemoView> {
  late final TextEditingController searchController = TextEditingController();
  late final ArticleIdeaRepository articleIdeaRepository =
      ArticleIdeaRepository();

  bool fetchingArticleIdeas = false;
  List<String> articleIdeas = [];
  String query = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          AppTextField(
            hintText: 'Type anything',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: SendButton(
              busy: fetchingArticleIdeas,
              onTap: () => fetchArticleIdeas(searchController.text),
            ),
            controller: searchController,
          ),
          Expanded(
            /// In a real app, you would handle the error case as well
            child: fetchingArticleIdeas
                ? const GeminiDemoLoadingView()
                : GeminiDemoDataView(articleIdeas: articleIdeas),
          ),
        ],
      ),
    );
  }

  Future<void> fetchArticleIdeas(String query) async {
    if (query.isEmpty) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Please input what\'s on your mind'),
          ),
        );

      return;
    }

    setState(() => fetchingArticleIdeas = true);

    articleIdeas = await articleIdeaRepository.fetchArticleIdeas(query: query);

    setState(() => fetchingArticleIdeas = false);
  }
}
