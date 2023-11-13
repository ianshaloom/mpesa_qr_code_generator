import 'package:hive_flutter/hive_flutter.dart';

part 'mpesa_qr_code.g.dart';

@HiveType(typeId: 0)
class MpesaQrCode extends HiveObject {
  @HiveField(0)
  final String qrCodeId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final String qrCodeData;
  @HiveField(4)
  final DateTime date;

  MpesaQrCode({
    required this.qrCodeId,
    required this.title,
    required this.amount,
    required this.qrCodeData,
    required this.date,
  });
}
