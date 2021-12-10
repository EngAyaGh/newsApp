import 'package:flutter/material.dart';
import 'package:news/view/news_page.dart';
import 'package:news/widget/cardnews.dart';
import 'package:provider/provider.dart';

import 'VModel/vm_article.dart';

void main() {
  runApp(newsapp());
}

class newsapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticlesListViewModel>(
      create: (context) => ArticlesListViewModel(),
      child: MaterialApp(
        home: newsPage(),
      ),
    );
  }
}