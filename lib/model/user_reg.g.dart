// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reg.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRegAdapter extends TypeAdapter<UserReg> {
  @override
  final int typeId = 0;

  @override
  UserReg read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserReg()
      ..username = fields[0] as String
      ..email = fields[1] as String
      ..phone = fields[2] as String
      ..password = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, UserReg obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRegAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
