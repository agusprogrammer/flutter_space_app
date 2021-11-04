// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventHiveAdapter extends TypeAdapter<EventHive> {
  @override
  final int typeId = 2;

  @override
  EventHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventHive()
      ..id = fields[0] as int
      ..url = fields[1] as String
      ..slug = fields[2] as String
      ..name = fields[3] as String
      ..type = fields[4] as String
      ..description = fields[5] as String
      ..location = fields[6] as String
      ..newsUrl = fields[7] as String
      ..featureImage = fields[8] as String
      ..date = fields[9] as String
      ..nextResults = fields[10] as String
      ..previousResults = fields[11] as String;
  }

  @override
  void write(BinaryWriter writer, EventHive obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.location)
      ..writeByte(7)
      ..write(obj.newsUrl)
      ..writeByte(8)
      ..write(obj.featureImage)
      ..writeByte(9)
      ..write(obj.date)
      ..writeByte(10)
      ..write(obj.nextResults)
      ..writeByte(11)
      ..write(obj.previousResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
