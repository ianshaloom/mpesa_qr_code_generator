import 'package:hive_flutter/hive_flutter.dart';

import '../../constants.dart';
import '../../domain/entity/qr_mpesa/mpesa_qr_code.dart';
import 'mpesa_qr_codes_datasource.dart';

class MpesaQrCodeHiveDataSource implements MpesaQrCodeDataSource {
  MpesaQrCodeHiveDataSource()
      : _mpesaQrCodesBox = Hive.box<MpesaQrCode>(qrMpesaCodeBox);

  final Box<MpesaQrCode> _mpesaQrCodesBox;

  @override
  Future<void> addMpesaQrCode(MpesaQrCode mpesaQrCode) async {
    await _mpesaQrCodesBox.add(mpesaQrCode);
  }

  @override
  Future<void> deleteMpesaQrCode(MpesaQrCode mpesaQrCode) async {
    await _mpesaQrCodesBox.delete(mpesaQrCode.key);
  }

  @override
  Future<List<MpesaQrCode>> getMpesaQrCodeList() async {
    return _mpesaQrCodesBox.values.toList();
  }
}
