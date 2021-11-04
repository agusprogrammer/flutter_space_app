// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launcher_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LauncherHiveAdapter extends TypeAdapter<LauncherHive> {
  @override
  final int typeId = 3;

  @override
  LauncherHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LauncherHive()
      ..id = fields[0] as int
      ..url = fields[1] as String
      ..flightProven = fields[2] as String
      ..serialNumber = fields[3] as String
      ..status = fields[4] as String
      ..details = fields[5] as String
      ..launchConfId = fields[6] as int
      ..launchConfUrl = fields[7] as String
      ..launchConfName = fields[8] as String
      ..launchConfFamily = fields[9] as String
      ..launchConfFullName = fields[10] as String
      ..launchConfVariant = fields[11] as String
      ..imageUrl = fields[12] as String
      ..flights = fields[13] as String
      ..lastLaunchDate = fields[14] as String
      ..firstLaunchDate = fields[15] as String
      ..nextResults = fields[16] as String
      ..previousResults = fields[17] as String;
  }

  @override
  void write(BinaryWriter writer, LauncherHive obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.flightProven)
      ..writeByte(3)
      ..write(obj.serialNumber)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.details)
      ..writeByte(6)
      ..write(obj.launchConfId)
      ..writeByte(7)
      ..write(obj.launchConfUrl)
      ..writeByte(8)
      ..write(obj.launchConfName)
      ..writeByte(9)
      ..write(obj.launchConfFamily)
      ..writeByte(10)
      ..write(obj.launchConfFullName)
      ..writeByte(11)
      ..write(obj.launchConfVariant)
      ..writeByte(12)
      ..write(obj.imageUrl)
      ..writeByte(13)
      ..write(obj.flights)
      ..writeByte(14)
      ..write(obj.lastLaunchDate)
      ..writeByte(15)
      ..write(obj.firstLaunchDate)
      ..writeByte(16)
      ..write(obj.nextResults)
      ..writeByte(17)
      ..write(obj.previousResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LauncherHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
