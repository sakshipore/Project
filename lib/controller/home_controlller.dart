import 'dart:developer';

import 'package:get/get.dart';
import 'package:pingoo_learn_assignment/model/article.dart';
import 'package:pingoo_learn_assignment/services/news_service.dart';

class HomeController extends GetxController {
  List<Article> articles = [];
  NewsService service = NewsService();
  bool isLoading = true;

  Future<void> getNews() async {
    try {
      Map<String, dynamic> res = await service.getNews();
      articles = [];
      List<dynamic> allArticles = res["articles"];
      for (Map<String, dynamic> item in allArticles) {
        articles.add(Article.fromMap(item));
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
      update();
    }
  }
}
