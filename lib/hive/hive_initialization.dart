import 'package:hive_flutter/hive_flutter.dart';

import '../constants.dart';
import '../domain/entity/qr_mpesa/mpesa_qr_code.dart';

class HiveInitialization {
  static Future<void> initFlutter(String subDir) async {
    Hive.init(subDir);
    await Hive.openBox<MpesaQrCode>(qrMpesaCodeBox);
  }

  static Future<void> registerAdapters() async {
    Hive.registerAdapter(MpesaQrCodeAdapter());
  }
}
