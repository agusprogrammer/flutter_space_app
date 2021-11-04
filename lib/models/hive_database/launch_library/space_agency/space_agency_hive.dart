import 'package:hive/hive.dart';

part 'space_agency_hive.g.dart';

@HiveType(typeId: 4) // unique id per class
class SpaceAgencyHive extends HiveObject {
  
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String url;
  @HiveField(2)
  late String name;
  @HiveField(3)
  late String type;
  @HiveField(4)
  late String countryCode;
  @HiveField(5)
  late String abbrev;
  @HiveField(6)
  late String description;
  @HiveField(7)
  late String administrator;
  @HiveField(8)
  late String foundingYear;
  @HiveField(9)
  late String launchers;
  @HiveField(10)
  late String spacecraft;
  @HiveField(11)
  late String parent;
  @HiveField(12)
  late String imageURL;
  @HiveField(13)
  late String nextResults;
  @HiveField(14)
  late String previousResults;

}