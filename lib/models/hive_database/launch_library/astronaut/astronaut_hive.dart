import 'package:hive/hive.dart';

part 'astronaut_hive.g.dart';

@HiveType(typeId: 1) // unique id per class
class AstronautHive extends HiveObject {
  
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String url;
  @HiveField(2)
  late String name;
  @HiveField(3)
  late String status;
  @HiveField(4)
  late String type;
  @HiveField(5)
  late String agency;
  @HiveField(6)
  late String dateOfBirth;
  @HiveField(7)
  late String dateOfDeath;
  @HiveField(8)
  late String nationality;
  @HiveField(9)
  late String wiki;
  @HiveField(10)
  late String bio;
  @HiveField(11)
  late String profileImage;
  @HiveField(12)
  late String profileImageThumbnail;
  @HiveField(13)
  late String lastFlight;
  @HiveField(14)
  late String firstFlight;
  @HiveField(15)
  late String nextResults;
  @HiveField(16)
  late String previousResults;

}