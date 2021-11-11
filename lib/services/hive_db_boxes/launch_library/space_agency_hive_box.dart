import 'package:flutter_space_app/models/hive_database/launch_library/space_agency/space_agency_hive.dart';
import 'package:hive/hive.dart';

class SpaceAgencyHiveBox {
  static Box<SpaceAgencyHive> getSpaceAgencyBox() => Hive.box<SpaceAgencyHive>('space_agency_hive_box');
}