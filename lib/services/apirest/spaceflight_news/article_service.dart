import 'dart:convert';
import 'package:flutter_space_app/models/apirest/spaceflight_news/article/article.dart';
import 'package:http/http.dart';

class ArticleService {

  late Response _resp;
  late List<Article> listArticles = [];
  late bool errorResponseBool = true;
  
  // Obtain a list of article with get from url
  Future <List<Article>> fetchGetArticlesLimit(Client client, int _numResults) async {

    try{

      final response = await client.get(Uri.parse('https://api.spaceflightnewsapi.net/v3/articles?_limit=$_numResults'));
      _resp = response;
      errorResponseBool = false;

    }catch(e){

      Response responseCatch = new Response('', 404, reasonPhrase: 'Data not found, check your internet conection.');
      _resp = responseCatch;
      listArticles = parseArticles(_resp.body);

    }

    if(errorResponseBool == false) {
      listArticles = parseArticles(_resp.body);
    }

    return listArticles;

  }

  // converts the Json of the response to a list
  List<Article> parseArticles(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Article>((json) => Article.fromJson(json)).toList();
  }
  
  // method for obtain the response for show http errors on graphic interface
  Response obtainResponse() {
    return _resp;
  }

}