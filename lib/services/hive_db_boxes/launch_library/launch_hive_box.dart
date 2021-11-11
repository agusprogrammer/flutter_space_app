import 'package:flutter_space_app/models/hive_database/launch_library/launch/launch_hive.dart';
import 'package:hive/hive.dart';

class LaunchHiveBox {
  static Box<LaunchHive> getLaunchBox() => Hive.box<LaunchHive>('launch_hive_box');
}