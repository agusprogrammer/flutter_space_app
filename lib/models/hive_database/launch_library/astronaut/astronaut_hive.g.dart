// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'astronaut_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AstronautHiveAdapter extends TypeAdapter<AstronautHive> {
  @override
  final int typeId = 1;

  @override
  AstronautHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AstronautHive()
      ..id = fields[0] as int
      ..url = fields[1] as String
      ..name = fields[2] as String
      ..status = fields[3] as String
      ..type = fields[4] as String
      ..agency = fields[5] as String
      ..dateOfBirth = fields[6] as String
      ..dateOfDeath = fields[7] as String
      ..nationality = fields[8] as String
      ..wiki = fields[9] as String
      ..bio = fields[10] as String
      ..profileImage = fields[11] as String
      ..profileImageThumbnail = fields[12] as String
      ..lastFlight = fields[13] as String
      ..firstFlight = fields[14] as String
      ..nextResults = fields[15] as String
      ..previousResults = fields[16] as String;
  }

  @override
  void write(BinaryWriter writer, AstronautHive obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.type)
      ..writeByte(5)
      ..write(obj.agency)
      ..writeByte(6)
      ..write(obj.dateOfBirth)
      ..writeByte(7)
      ..write(obj.dateOfDeath)
      ..writeByte(8)
      ..write(obj.nationality)
      ..writeByte(9)
      ..write(obj.wiki)
      ..writeByte(10)
      ..write(obj.bio)
      ..writeByte(11)
      ..write(obj.profileImage)
      ..writeByte(12)
      ..write(obj.profileImageThumbnail)
      ..writeByte(13)
      ..write(obj.lastFlight)
      ..writeByte(14)
      ..write(obj.firstFlight)
      ..writeByte(15)
      ..write(obj.nextResults)
      ..writeByte(16)
      ..write(obj.previousResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AstronautHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
