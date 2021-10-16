
import 'package:http/http.dart';

class Event {
  final int id;
  final String url;
  final String slug;
  final String name;
  final String type;
  final String description;
  final String location;
  final String newsUrl;
  final String featureImage;
  final String date;
  final String nextResults;
  final String previousResults;

  const Event({required this.id,required this.url,required this.slug,required this.name, 
  required this.type, required this.description, required this.location, required this.newsUrl, 
  required this.featureImage,required this.date, 
  required this.nextResults, required this.previousResults});
}