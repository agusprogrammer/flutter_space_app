// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spacecraft_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpacecraftHiveAdapter extends TypeAdapter<SpacecraftHive> {
  @override
  final int typeId = 6;

  @override
  SpacecraftHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpacecraftHive()
      ..id = fields[0] as int
      ..url = fields[1] as String
      ..name = fields[2] as String
      ..serialNumber = fields[3] as String
      ..status = fields[4] as String
      ..description = fields[5] as String
      ..spcConfName = fields[6] as String
      ..spcConfType = fields[7] as String
      ..agencyName = fields[8] as String
      ..agencyType = fields[9] as String
      ..inUse = fields[10] as String
      ..imageUrl = fields[11] as String
      ..nextResults = fields[12] as String
      ..previousResults = fields[13] as String;
  }

  @override
  void write(BinaryWriter writer, SpacecraftHive obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.serialNumber)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.spcConfName)
      ..writeByte(7)
      ..write(obj.spcConfType)
      ..writeByte(8)
      ..write(obj.agencyName)
      ..writeByte(9)
      ..write(obj.agencyType)
      ..writeByte(10)
      ..write(obj.inUse)
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
      other is SpacecraftHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
