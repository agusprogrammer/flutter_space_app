// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space_station_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpaceStationHiveAdapter extends TypeAdapter<SpaceStationHive> {
  @override
  final int typeId = 5;

  @override
  SpaceStationHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpaceStationHive()
      ..id = fields[0] as int
      ..url = fields[1] as String
      ..name = fields[2] as String
      ..idStatus = fields[3] as int
      ..status = fields[4] as String
      ..idType = fields[5] as int
      ..type = fields[6] as String
      ..founded = fields[7] as String
      ..deorbited = fields[8] as String
      ..description = fields[9] as String
      ..orbit = fields[10] as String
      ..imageUrl = fields[11] as String
      ..nextResults = fields[12] as String
      ..previousResults = fields[13] as String;
  }

  @override
  void write(BinaryWriter writer, SpaceStationHive obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.idStatus)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.idType)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.founded)
      ..writeByte(8)
      ..write(obj.deorbited)
      ..writeByte(9)
      ..write(obj.description)
      ..writeByte(10)
      ..write(obj.orbit)
      ..writeByte(11)
      ..write(obj.imageUrl)
      ..writeByte(12)
      ..write(obj.nextResults)
      ..writeByte(13)
      ..write(obj.previousResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpaceStationHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
