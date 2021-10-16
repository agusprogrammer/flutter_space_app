
import 'package:http/http.dart';

class Launch {
  final String id;
  final String url;
  final String slug;
  final String name;
  
  final int statusId;
  final String statusName;
  final String statusAbbrev;
  final String statusDescription;

  final String lastUpdated;
  final String net;
  final String windowEnd;
  final String windowStart;
  // final int probability;
  final String holdreason;
  final String failreason;

  final int launchServProvId;
  final String launchServProvUrl;
  final String launchServProvName;
  final String launchServProvType;

  final String rocketName;
  final String rocketFamily;
  final String rocketFullName;
  final String rocketVariant;

  final String missionName;
  final String missionDescription;
  final String missionLaunchDesignator;
  final String missionType;
  
  final String missionOrbitName;
  final String missionOrbitAbbrev;

  final String padLocationName;

  final String image;
  final String infographic;

  const Launch({
    required this.id, required this.url, required this.slug, required this.name, required this.statusId, 
    required this.statusName, required this.statusAbbrev, required this.statusDescription, 
    required this.lastUpdated, required this.net, required this.windowEnd, required this.windowStart, 
    // required this.probability, 
    required this.holdreason, required this.failreason, required this.launchServProvId, 
    required this.launchServProvUrl, required this.launchServProvName, required this.launchServProvType, 
    required this.rocketName, required this.rocketFamily, required this.rocketFullName, required this.rocketVariant, 
    required this.missionName, required this.missionDescription, required this.missionLaunchDesignator, 
    required this.missionType, required this.missionOrbitName, required this.missionOrbitAbbrev, 
    required this.padLocationName, required this.image, required this.infographic
  });

}
