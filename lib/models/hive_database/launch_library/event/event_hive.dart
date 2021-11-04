import 'package:hive/hive.dart';

part 'event_hive.g.dart';

@HiveType(typeId: 2) // unique id per class
class EventHive extends HiveObject {
  
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String url;
  @HiveField(2)
  late String slug;
  @HiveField(3)
  late String name;
  @HiveField(4)
  late String type;
  @HiveField(5)
  late String description;
  @HiveField(6)
  late String location;
  @HiveField(7)
  late String newsUrl;
  @HiveField(8)
  late String featureImage;
  @HiveField(9)
  late String date;
  @HiveField(10)
  late String nextResults;
  @HiveField(11)
  late String previousResults;

}