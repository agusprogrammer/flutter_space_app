import 'package:flutter_space_app/models/hive_database/launch_library/space_station/space_station_hive.dart';
import 'package:hive/hive.dart';

class SpaceStationHiveBox {
  static Box<SpaceStationHive> getSpaceStationBox() => Hive.box<SpaceStationHive>('space_station_hive_box');
}