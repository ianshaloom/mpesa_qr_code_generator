import '../entity/qr_mpesa_request.dart';
import '../entity/qr_response.dart';

abstract class MpesaQrCodeGenerateRepo {
  Future<QrMpesaResponse> getMpesaQrCode(
    String accessToken,
    QrMpesaRequest qrMpesaRequest,
  );
}
