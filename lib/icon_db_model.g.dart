// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon_db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IconDbModelAdapter extends TypeAdapter<IconDbModel> {
  @override
  final int typeId = 0;

  @override
  IconDbModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IconDbModel()
      ..size = fields[0] as int
      ..colorValue = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, IconDbModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.size)
      ..writeByte(1)
      ..write(obj.colorValue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IconDbModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
