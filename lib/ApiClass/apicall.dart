import 'dart:convert';
import 'dart:io';

import "package:http/http.dart";
import 'package:thenews/models/models.dart';

class ApiCallClass {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c5810690c39b416d8b642f75e41612e9";

  Future<List<Article>> getNews() async {
    try {
      Response news = await get(Uri.parse(endPointUrl));
      if (news.statusCode == 200) {
        final Iterable rawJson = jsonDecode(news.body)["articles"];
        List<Article> articles =
            rawJson.map((article) => Article.fromJson(article)).toList();
        return articles;
      } else {
        throw "Can't get Article";
      }
    } on SocketException {
      throw "You are not connected to the internet";
    } catch (e) {
      throw "An unexpected error occured";
    }
  }
}
