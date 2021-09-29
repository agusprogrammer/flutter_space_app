
import 'package:flutter_space_app/models/apirest/launch_library/space_station/space_station.dart';

class LaunchLibraryResp {
  
  final int count;
  final String next;
  final String previous;

  // var list = parsedJson['results'] as List;

  // final List<SpaceStation> results; // List of any type of objects

  const LaunchLibraryResp(
    {
      required this.count,
      required this.next,
      required this.previous,
      // required this.results
    }
  );

  /*
  factory LaunchLibraryResp.fromJson(Map<String,dynamic> item){
    
    return LaunchLibraryResp(
      count: item['count'] as int,
      next: item['next'] as String,
      previous: item['previous'] as String,
      // results: SpaceStation.fromJson(item['results']);
      results: parseSpaceStations(item) as List<SpaceStation>
    );
    
  }
  */

  /*
  static List<SpaceStation> parseSpaceStations(item) {
    // List<SpaceStation> spaceStations = new List<SpaceStation>.from(item);
    // List<SpaceStation> spaceStations = List.
    var list = item['results'] as List;
    List<SpaceStation> spaceStations = list.map((data) => SpaceStation.fromJson(data)).toList();
    return spaceStations;
  }
  */

  factory LaunchLibraryResp.fromJson(Map<String,dynamic> json){
    return LaunchLibraryResp(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      // results: parseSpaceStations(json)
    );
  }

  /*
  static List<SpaceStation> parseSpaceStations(stationsJson) {
    var list = stationsJson['results'] as List;
    
    List<SpaceStation> spaceStationList =
    list.map((data) => SpaceStation.fromJson(data)).toList();
    return spaceStationList;
  }
  */

}

