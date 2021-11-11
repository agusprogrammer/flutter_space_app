import 'package:flutter_space_app/models/hive_database/launch_library/spacecraft/spacecraft_hive.dart';
import 'package:hive/hive.dart';

class SpacecraftHiveBox {
  static Box<SpacecraftHive> getSpacecraftBox() => Hive.box<SpacecraftHive>('spacecraft_hive_box');
}