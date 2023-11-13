import '../../domain/entity/qr_mpesa_request.dart';
import '../../domain/entity/qr_response.dart';
import '../../domain/repo/qr_code_generate_repo.dart';
import '../datasource/qr_code_mpesa_generate_ds.dart';
import '../model/qr_response_model.dart';

class QrCodeGenerateRepoImpl implements MpesaQrCodeGenerateRepo {
  final QrCodeMpesaGenerateDs qrCodeMpesaGenerateDs;
  QrCodeGenerateRepoImpl(this.qrCodeMpesaGenerateDs);

  @override
  Future<QrMpesaResponse> getMpesaQrCode(
      String accessToken, QrMpesaRequest qrMpesaRequest) async {
    final QrMpesaResponseModel q =
        await qrCodeMpesaGenerateDs.getMpesaQrCode(accessToken, qrMpesaRequest);
    final QrMpesaResponse qrMpesaResponse = QrMpesaResponse(
      responseCode: q.responseCode,
      responseDescription: q.responseDescription,
      qrCode: q.qrCode,
      amount: q.amount,
      merchantName: q.merchantName,
      transactionName: q.transactionName,
    );

    return qrMpesaResponse;
  }
}
