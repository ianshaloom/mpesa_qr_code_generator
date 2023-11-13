import '../../domain/repo/qr_code_auth_repo.dart';
import '../datasource/qr_code_mpesa_auth_ds.dart';

class QrMpesaAuthRepoImpl implements QrMpesaAuthRepo {
  final QrCodeMpesaAuthDs qrMpesaAuthDs;
  QrMpesaAuthRepoImpl({required this.qrMpesaAuthDs});

  @override
  Future<String> getQrMpesaAuth() async {
    return await qrMpesaAuthDs.getAuthToken();
  }

}
