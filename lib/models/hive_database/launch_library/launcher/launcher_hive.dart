import 'package:hive/hive.dart';

part 'launcher_hive.g.dart';

@HiveType(typeId: 3) // unique id per class
class LauncherHive extends HiveObject {
  
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String url;
  @HiveField(2)
  late String flightProven;
  @HiveField(3)
  late String serialNumber;
  @HiveField(4)
  late String status;
  @HiveField(5)
  late String details;
  @HiveField(6)
  late int launchConfId;
  @HiveField(7)
  late String launchConfUrl;
  @HiveField(8)
  late String launchConfName;
  @HiveField(9)
  late String launchConfFamily;
  @HiveField(10)
  late String launchConfFullName;
  @HiveField(11)
  late String launchConfVariant;
  @HiveField(12)
  late String imageUrl;
  @HiveField(13)
  late String flights;
  @HiveField(14)
  late String lastLaunchDate;
  @HiveField(15)
  late String firstLaunchDate;
  @HiveField(16)
  late String nextResults;
  @HiveField(17)
  late String previousResults;

}
