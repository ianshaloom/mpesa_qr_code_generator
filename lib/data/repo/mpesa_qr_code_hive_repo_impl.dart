import '../../domain/entity/qr_mpesa/mpesa_qr_code.dart';
import '../../domain/repo/mpesa_qr_code_hive_repo.dart';
import '../datasource/mpesa_qr_codes_datasource.dart';

class MpesaQrCodesHiveRepoImpl implements MpesaQrCodesHiveRepo{
  const MpesaQrCodesHiveRepoImpl(this._mpesaQrCodeDataSource);
  final MpesaQrCodeDataSource _mpesaQrCodeDataSource;

  @override
  Future<void> addMpesaQrCode(MpesaQrCode mpesaQrCode) async {
    await _mpesaQrCodeDataSource.addMpesaQrCode(mpesaQrCode);
  }

  @override
  Future<void> deleteMpesaQrCode(MpesaQrCode mpesaQrCode) async {
    await _mpesaQrCodeDataSource.deleteMpesaQrCode(mpesaQrCode);
  }

  @override
  Future<List<MpesaQrCode>> getMpesaQrCodeList() async {
    return await _mpesaQrCodeDataSource.getMpesaQrCodeList();
  }
  
}