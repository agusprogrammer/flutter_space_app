
import 'package:http/http.dart';

class Blog{

  final int id;
  final String title;
  final String url;
  final String imageUrl;
  final String newsSite;
  final String summary;
  final String publishedAt;

  final List<dynamic> launches;
  final List<dynamic> events;

  const Blog(
    {
      required this.id, 
      required this.title,
      required this.url,
      required this.imageUrl, 
      required this.newsSite,
      required this.summary,
      required this.publishedAt,
      required this.launches,
      required this.events,
    }
  );

  factory Blog.fromJson(Map<String,dynamic> item){

    return Blog(
       id: item['id'] as int,
      title: item['title'] as String,
      url: item['url'] as String,
      imageUrl: item['imageUrl'] as String,
      newsSite: item['newsSite'] as String,
      summary: item['summary'] as String,
      publishedAt: item['publishedAt'] as String,
      launches: item['launches'] as List<dynamic>,
      events: item['events'] as List<dynamic>,
    );

  }

}
