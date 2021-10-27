// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LaunchHiveAdapter extends TypeAdapter<LaunchHive> {
  @override
  final int typeId = 0;

  @override
  LaunchHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LaunchHive()
      ..id = fields[0] as String
      ..url = fields[1] as String
      ..slug = fields[2] as String
      ..name = fields[3] as String
      ..statusId = fields[4] as int
      ..statusName = fields[5] as String
      ..statusAbbrev = fields[6] as String
      ..statusDescription = fields[7] as String
      ..lastUpdated = fields[8] as String
      ..net = fields[9] as String
      ..windowEnd = fields[10] as String
      ..windowStart = fields[11] as String
      ..holdreason = fields[12] as String
      ..failreason = fields[13] as String
      ..launchServProvId = fields[14] as int
      ..launchServProvUrl = fields[15] as String
      ..launchServProvName = fields[16] as String
      ..launchServProvType = fields[17] as String
      ..rocketName = fields[18] as String
      ..rocketFamily = fields[19] as String
      ..rocketFullName = fields[20] as String
      ..rocketVariant = fields[21] as String
      ..missionName = fields[22] as String
      ..missionDescription = fields[23] as String
      ..missionLaunchDesignator = fields[24] as String
      ..missionType = fields[25] as String
      ..missionOrbitName = fields[26] as String
      ..missionOrbitAbbrev = fields[27] as String
      ..padLocationName = fields[28] as String
      ..image = fields[29] as String
      ..infographic = fields[30] as String
      ..nextResults = fields[31] as String
      ..previousResults = fields[32] as String;
  }

  @override
  void write(BinaryWriter writer, LaunchHive obj) {
    writer
      ..writeByte(33)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.statusId)
      ..writeByte(5)
      ..write(obj.statusName)
      ..writeByte(6)
      ..write(obj.statusAbbrev)
      ..writeByte(7)
      ..write(obj.statusDescription)
      ..writeByte(8)
      ..write(obj.lastUpdated)
      ..writeByte(9)
      ..write(obj.net)
      ..writeByte(10)
      ..write(obj.windowEnd)
      ..writeByte(11)
      ..write(obj.windowStart)
      ..writeByte(12)
      ..write(obj.holdreason)
      ..writeByte(13)
      ..write(obj.failreason)
      ..writeByte(14)
      ..write(obj.launchServProvId)
      ..writeByte(15)
      ..write(obj.launchServProvUrl)
      ..writeByte(16)
      ..write(obj.launchServProvName)
      ..writeByte(17)
      ..write(obj.launchServProvType)
      ..writeByte(18)
      ..write(obj.rocketName)
      ..writeByte(19)
      ..write(obj.rocketFamily)
      ..writeByte(20)
      ..write(obj.rocketFullName)
      ..writeByte(21)
      ..write(obj.rocketVariant)
      ..writeByte(22)
      ..write(obj.missionName)
      ..writeByte(23)
      ..write(obj.missionDescription)
      ..writeByte(24)
      ..write(obj.missionLaunchDesignator)
      ..writeByte(25)
      ..write(obj.missionType)
      ..writeByte(26)
      ..write(obj.missionOrbitName)
      ..writeByte(27)
      ..write(obj.missionOrbitAbbrev)
      ..writeByte(28)
      ..write(obj.padLocationName)
      ..writeByte(29)
      ..write(obj.image)
      ..writeByte(30)
      ..write(obj.infographic)
      ..writeByte(31)
      ..write(obj.nextResults)
      ..writeByte(32)
      ..write(obj.previousResults);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LaunchHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
