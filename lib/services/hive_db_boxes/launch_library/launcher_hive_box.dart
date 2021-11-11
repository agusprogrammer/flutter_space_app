import 'package:flutter_space_app/models/hive_database/launch_library/launcher/launcher_hive.dart';
import 'package:hive/hive.dart';

class LauncherHiveBox {
  static Box<LauncherHive> getLauncherBox() => Hive.box<LauncherHive>('launcher_hive_box');
}