import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/article/article.dart';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ArticleService {

  // static const API ='https://api.spaceflightnewsapi.net/v3/articles?';
  // late Future <List<Article>> artList;

  late Response _resp;
  late List<Article> listArticles = [];
  late bool errorResponseBool = true;
  
  Future <List<Article>> fetchGetArticlesLimit(Client client, int _numResults) async {

    try{

      final response = await client.get(Uri.parse('https://api.spaceflightnewsapi.net/v3/articles?_limit=$_numResults'));
      _resp = response;
      errorResponseBool = false;
      
      // return parseArticles(response.body);

    }catch(e){

      Response responseCatch = new Response('', 404, reasonPhrase: 'Data not found, check your internet conection.');
      _resp = responseCatch;
      listArticles = parseArticles(_resp.body);

    }

    if(errorResponseBool == false) {
      listArticles = parseArticles(_resp.body);
    }

    return listArticles;
    // return compute(parseArticles, response.body); (para html)

  }

  // A function that converts a response body into a List<Article>.
  List<Article> parseArticles(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Article>((json) => Article.fromJson(json)).toList();
  }

  Response obtainResponse() {
    return _resp;
  }

}