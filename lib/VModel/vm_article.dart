import 'package:flutter/cupertino.dart';
import 'package:news/models/article.dart';
import 'package:news/services/news_api.dart';

class ArticlesListViewModel extends ChangeNotifier {
  List<Article>? _articlesList = [];
  List<Article>? _articlesListByCategory = [];

  Future<void> fetchArticles() async {
    print('lengggggthhhhbefooore is ${_articlesList!.length}');
    _articlesList = await NewsApi().fetchArticles();
    print('lengggggthhhh is ${_articlesList!.length}');
    notifyListeners();
  }

  Future<void> fetchArticlesByCategory(String category) async {
    _articlesListByCategory = await NewsApi().fetchArticlesByCategory(category);
    notifyListeners();
  }
void initialvalues(){
  _articlesList = [];
  _articlesListByCategory = [];
  notifyListeners();
}
  List<Article>? get articlesList => _articlesList;
  List<Article>? get articlesListByCategory => _articlesListByCategory;
}