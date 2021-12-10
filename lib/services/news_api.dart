import 'dart:convert';

import 'package:news/models/article.dart';
import 'package:http/http.dart' as http;
import 'package:news/models/articles.dart';

class NewsApi {
  final String apiKey = 'ce98fa4843e94f6e8ebff54614c85613';
  Future<List<Article>?> fetchArticles() async {
    try {
      String url= "https://newsapi.org/v2/top-headlines?country=eg&apiKey=$apiKey";
      var uri = Uri.parse(url);
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesList articles = ArticlesList.fromJson(jsonData);
        print('the lenbefore  ${articles.articles.length}');

    /*    List<Article> articlesList =[];
        articlesList.add(articles.articles[1]) ;
        print('the lenbefore2  ${articlesList.length}');
*/
        List<Article> articlesList= articles.articles
            .map(
                (e){ print('the len in map  ${e}');
                return Article.fromJson(e);}
            ).toList();
        print('sadsds');
        if(articlesList !=null) print('the len ');//${articlesList.length}');
        return articlesList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }

  }

  Future<List<Article>?> fetchArticlesByCategory(String category) async {
    try {
      String url= 'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$apiKey';
      var uri = Uri.parse(url);
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesList articles = ArticlesList.fromJson(jsonData);
        List<Article> articlesList =
        articles.articles.map((e) => Article.fromJson(e)).toList();
        return articlesList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
    return null;
  }
}