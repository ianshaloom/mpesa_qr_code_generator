// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mpesa_qr_code.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MpesaQrCodeAdapter extends TypeAdapter<MpesaQrCode> {
  @override
  final int typeId = 0;

  @override
  MpesaQrCode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MpesaQrCode(
      qrCodeId: fields[0] as String,
      title: fields[1] as String,
      amount: fields[2] as double,
      qrCodeData: fields[3] as String,
      date: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, MpesaQrCode obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.qrCodeId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.qrCodeData)
      ..writeByte(4)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MpesaQrCodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
