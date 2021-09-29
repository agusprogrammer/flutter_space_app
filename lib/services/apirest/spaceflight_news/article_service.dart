import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/article/article.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ArticleService {

  // static const API ='https://api.spaceflightnewsapi.net/v3/articles?';
  final int _numResults = 10;
  // late Future <List<Article>> artList;
  
  Future <List<Article>> fetchGetArticlesLimit(Client client) async {

    final response = await client.get(Uri.parse('https://api.spaceflightnewsapi.net/v3/articles?_limit=$_numResults'));


    /*
    if(response.statusCode == 200) {
      
      // return Article.fromJson(jsonDecode(response.body));
      artList = parseArticles(response.body) as Future<List<Article>>;

    } else {
      throw Exception('Failed to load');
    }
    */

    return compute(parseArticles, response.body);

  }

  // A function that converts a response body into a List<Article>.
  List<Article> parseArticles(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Article>((json) => Article.fromJson(json)).toList();
  }

}