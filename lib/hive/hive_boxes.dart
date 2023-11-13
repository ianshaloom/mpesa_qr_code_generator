import 'package:hive_flutter/hive_flutter.dart';

import '../constants.dart';
import '../domain/entity/qr_mpesa/mpesa_qr_code.dart';

class Hiveboxes{
  static Box<MpesaQrCode> get mpesaQrCodesBox => Hive.box<MpesaQrCode>(qrMpesaCodeBox);
}