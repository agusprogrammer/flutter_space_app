import 'package:flutter_space_app/models/hive_database/launch_library/event/event_hive.dart';
import 'package:hive/hive.dart';

class EventHiveBox {
  static Box<EventHive> getEventBox() => Hive.box<EventHive>('event_hive_box');
}