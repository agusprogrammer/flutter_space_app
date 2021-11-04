import 'package:flutter_space_app/models/hive_database/launch_library/launch/launch_hive.dart';
import 'package:hive/hive.dart';

class LaunchHiveBox {
  static Box<LaunchHive> getLaunchBox() => Hive.box<LaunchHive>('launch_hive_box');

  // static openBoxLaunchHiveBox() => Hive.openBox('launch_hive_box');

  // static closeBoxLaunchHiveBox() => Hive.box('launch_hive_box').close();

  // static closeAllBoxes() => Hive.close();

}