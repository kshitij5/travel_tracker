// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TravelEntryAdapter extends TypeAdapter<TravelEntry> {
  @override
  final int typeId = 0;

  @override
  TravelEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TravelEntry(
      startPoint: fields[0] as String,
      endPoint: fields[1] as String,
      startTime: fields[2] as DateTime,
      endTime: fields[3] as DateTime,
      travelMediums: (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, TravelEntry obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.startPoint)
      ..writeByte(1)
      ..write(obj.endPoint)
      ..writeByte(2)
      ..write(obj.startTime)
      ..writeByte(3)
      ..write(obj.endTime)
      ..writeByte(4)
      ..write(obj.travelMediums);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TravelEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
