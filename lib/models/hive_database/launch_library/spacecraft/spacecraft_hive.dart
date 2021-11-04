import 'package:hive/hive.dart';

part 'spacecraft_hive.g.dart';

@HiveType(typeId: 6) // unique id per class
class SpacecraftHive extends HiveObject {
  
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String url;
  @HiveField(2)
  late String name;
  @HiveField(3)
  late String serialNumber;
  @HiveField(4)
  late String status;
  @HiveField(5)
  late String description;
  @HiveField(6)
  late String spcConfName;
  @HiveField(7)
  late String spcConfType;
  @HiveField(8)
  late String agencyName;
  @HiveField(9)
  late String agencyType;
  @HiveField(10)
  late String inUse;
  @HiveField(11)
  late String imageUrl;
  @HiveField(12)
  late String nextResults;
  @HiveField(13)
  late String previousResults;

}