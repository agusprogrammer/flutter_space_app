import 'package:hive/hive.dart';

part 'space_station_hive.g.dart';

@HiveType(typeId: 5) // unique id per class
class SpaceStationHive extends HiveObject {
  
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String url;
  @HiveField(2)
  late String name;
  @HiveField(3)
  late int idStatus;
  @HiveField(4)
  late String status;
  @HiveField(5)
  late int idType;
  @HiveField(6)
  late String type;
  @HiveField(7)
  late String founded;
  @HiveField(8)
  late String deorbited;
  @HiveField(9)
  late String description;
  @HiveField(10)
  late String orbit;
  @HiveField(11)
  late String imageUrl;
  @HiveField(12)
  late String nextResults;
  @HiveField(13)
  late String previousResults;

}