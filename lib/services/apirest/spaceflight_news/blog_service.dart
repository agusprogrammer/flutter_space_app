
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/blog/blog.dart';
import 'package:http/http.dart';

class BlogService {

  late Response _resp;
  late List<Blog> listBlogs = [];
  late bool errorResponseBool = true; 

  Future <List<Blog>>fetchGetBlogsLimit(Client client, int _numResults) async {
    
    try{
      
      final response = await client.get(Uri.parse('https://api.spaceflightnewsapi.net/v3/blogs?_limit=$_numResults'));
      _resp = response;
      errorResponseBool = false;

    } catch (e) {

      Response responseCatch = new Response('', 404, reasonPhrase: 'Data not found, check your internet conection.');
      _resp = responseCatch;
      listBlogs = parseBlogs(_resp.body);

    }

    if(errorResponseBool == false) {
      listBlogs = parseBlogs(_resp.body);
    }

    return listBlogs; 
  }

  List<Blog> parseBlogs(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Blog>((json) => Blog.fromJson(json)).toList();
  }
  
  Response obtainResponse() {
    return _resp;
  }
  
}
