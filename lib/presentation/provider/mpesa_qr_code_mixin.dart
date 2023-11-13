import '../../domain/entity/qr_mpesa_request.dart';
import '../../domain/entity/qr_response.dart';
import '../../domain/repo/qr_code_auth_repo.dart';
import '../../domain/repo/qr_code_generate_repo.dart';

mixin MpesaQrCodeMixin {
  Future<String> getQrMpesaAuth(QrMpesaAuthRepo repo) async {
    print('getQrMpesaAuth');
    return await repo.getQrMpesaAuth();
  }

  Future<QrMpesaResponse> getMpesaQrCode(MpesaQrCodeGenerateRepo repo,
      String accessToken, QrMpesaRequest qrMpesaRequest) async {
    print('getMpesaQrCode');
    final QrMpesaResponse qrMpesaResponse =
        await repo.getMpesaQrCode(accessToken, qrMpesaRequest);

    return qrMpesaResponse;
  }
}
