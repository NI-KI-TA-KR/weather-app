// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherInfoAdapter extends TypeAdapter<WeatherInfo> {
  @override
  final int typeId = 2;

  @override
  WeatherInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherInfo(
      time: fields[0] as DateTime,
      description: fields[1] as String,
      icon: fields[2] as String,
      temperature: fields[3] as double?,
      min: fields[4] as double?,
      max: fields[5] as double?,
      clouds: fields[6] as int,
      humidity: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherInfo obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.temperature)
      ..writeByte(4)
      ..write(obj.min)
      ..writeByte(5)
      ..write(obj.max)
      ..writeByte(6)
      ..write(obj.clouds)
      ..writeByte(7)
      ..write(obj.humidity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
