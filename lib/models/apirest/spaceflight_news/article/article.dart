
import 'package:http/http.dart';

class Article {
  final int id;
  // late bool featured;
  final String title;
  final String url;
  final String imageUrl;
  final String newsSite;
  final String summary;
  final String publishedAt;
  final String updatedAt;

  final List<dynamic> launches;
  final List<dynamic> events;

  const Article(
    {
      required this.id, 
      required this.title,
      required this.url,
      required this.imageUrl, 
      required this.newsSite,
      required this.summary,
      required this.publishedAt,
      required this.updatedAt, 
      required this.launches,
      required this.events,
    }
  );

  factory Article.fromJson(Map<String,dynamic> item){
    
    return Article(
      id: item['id'] as int,
      title: item['title'] as String,
      url: item['url'] as String,
      imageUrl: item['imageUrl'] as String,
      newsSite: item['newsSite'] as String,
      summary: item['summary'] as String,
      publishedAt: item['publishedAt'] as String,
      updatedAt: item['updatedAt'] as String,
      launches: item['launches'] as List<dynamic>,
      events: item['events'] as List<dynamic>,
    );

  }
  
}