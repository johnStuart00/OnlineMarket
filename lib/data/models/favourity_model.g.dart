// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourity_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouritymodelAdapter extends TypeAdapter<Favourity_model> {
  @override
  final int typeId = 0;

  @override
  Favourity_model read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favourity_model(
      dis: fields[2] as String,
      id: fields[0] as String,
      name: fields[1] as String,
      price: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Favourity_model obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.dis)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouritymodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
