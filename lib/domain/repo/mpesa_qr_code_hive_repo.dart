
import '../entity/qr_mpesa/mpesa_qr_code.dart';

abstract class MpesaQrCodesHiveRepo{
  // add mpesa qr code
  Future<void> addMpesaQrCode(MpesaQrCode mpesaQrCode);
  // delete mpesa qr code
  Future<void> deleteMpesaQrCode(MpesaQrCode mpesaQrCode);
  // get a list of mpesa qr codes
  Future<List<MpesaQrCode>> getMpesaQrCodeList();
}