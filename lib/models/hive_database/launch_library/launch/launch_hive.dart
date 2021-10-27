
import 'package:hive/hive.dart';

part 'launch_hive.g.dart';

@HiveType(typeId: 0) // unique id per class
class LaunchHive extends HiveObject {

  @HiveField(0)
  late String id;
  @HiveField(1)
  late String url;
  @HiveField(2)
  late String slug;
  @HiveField(3)
  late String name;
  @HiveField(4)
  late int statusId;
  @HiveField(5)
  late String statusName;
  @HiveField(6)
  late String statusAbbrev;
  @HiveField(7)
  late String statusDescription;
  @HiveField(8)
  late String lastUpdated;
  @HiveField(9)
  late String net;
  @HiveField(10)
  late String windowEnd;
  @HiveField(11)
  late String windowStart;
  @HiveField(12)
  late String holdreason;
  @HiveField(13)
  late String failreason;
  @HiveField(14)
  late int launchServProvId;
  @HiveField(15)
  late String launchServProvUrl;
  @HiveField(16)
  late String launchServProvName;
  @HiveField(17)
  late String launchServProvType;
  @HiveField(18)
  late String rocketName;
  @HiveField(19)
  late String rocketFamily;
  @HiveField(20)
  late String rocketFullName;
  @HiveField(21)
  late String rocketVariant;
  @HiveField(22)
  late String missionName;
  @HiveField(23)
  late String missionDescription;
  @HiveField(24)
  late String missionLaunchDesignator;
  @HiveField(25)
  late String missionType;
  @HiveField(26)
  late String missionOrbitName;
  @HiveField(27)
  late String missionOrbitAbbrev;
  @HiveField(28)
  late String padLocationName;
  @HiveField(29)
  late String image;
  @HiveField(30)
  late String infographic;
  @HiveField(31)
  late String nextResults;
  @HiveField(32)
  late String previousResults;

}
