
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/blog/blog.dart';
import 'package:http/http.dart';

class BlogService {

  final int _numResults = 10;

  Future <List<Blog>>fetchGetBlogsLimit(Client client) async {
    
    final response = await client.get(Uri.parse('https://api.spaceflightnewsapi.net/v3/blogs?_limit=$_numResults'));
    
    return compute(parseBlogs, response.body);
  }

  List<Blog> parseBlogs(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Blog>((json) => Blog.fromJson(json)).toList();
  }
  

}
