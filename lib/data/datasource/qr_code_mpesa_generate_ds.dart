import '../../domain/entity/qr_mpesa_request.dart';
import '../model/qr_response_model.dart';

abstract class QrCodeMpesaGenerateDs {
  // get qr code
  Future<QrMpesaResponseModel> getMpesaQrCode(
    String accessToken,
    QrMpesaRequest qrMpesaRequest,
  );
}
