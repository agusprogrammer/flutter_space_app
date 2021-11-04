import 'package:flutter_space_app/models/hive_database/launch_library/astronaut/astronaut_hive.dart';
import 'package:hive/hive.dart';

class AstronautHiveBox {
  static Box<AstronautHive> getAstronautBox() => Hive.box<AstronautHive>('astronaut_hive_box');
}