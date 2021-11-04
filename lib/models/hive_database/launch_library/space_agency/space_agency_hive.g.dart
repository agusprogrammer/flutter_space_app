// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space_agency_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpaceAgencyHiveAdapter extends TypeAdapter<SpaceAgencyHive> {
  @override
  final int typeId = 4;

  @override
  SpaceAgencyHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpaceAgencyHive()
      ..id = fields[0] as int
      ..url = fields[1] as String
      ..name = fields[2] as String
      ..type = fields[3] as String
      ..countryCode = fields[4] as String
      ..abbrev = fields[5] as String
      ..description = fields[6] as String
      ..administrator = fields[7] as String
      ..foundingYear = fields[8] as String
      ..launchers = fields[9] as String
      ..spacecraft = fields[10] as String
      ..parent = fields[11] as String
      ..imageURL = fields[12] as String
      ..nextResults = fields[13] as String
      ..previousResults = fields[14] as String;
  }

  @override
  void write(BinaryWriter writer, SpaceAgencyHive obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.countryCode)
      ..writeByte(5)
      ..write(obj.abbrev)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.administrator)
      ..writeByte(8)
      ..write(obj.foundingYear)
      ..writeByte(9)
      ..write(obj.launchers)
      ..writeByte(10)
      ..write(obj.spacecraft)
      ..writeByte(11)
      ..write(obj.parent)
      ..writeByte(12)
      ..write(obj.imageURL)
      ..writeByte(13)
      ..write(obj.nextResults)
      ..writeByte(14)
      ..write(obj.previousResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpaceAgencyHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
