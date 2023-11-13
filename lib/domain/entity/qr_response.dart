import 'package:flutter/foundation.dart';

import '../../data/model/qr_response_model.dart';

@immutable
class QrMpesaResponse {
  final String responseCode;
  final String responseDescription;
  final String qrCode;
  final int amount;
  final String merchantName;
  final String transactionName;

  const QrMpesaResponse({
    required this.responseCode,
    required this.responseDescription,
    required this.qrCode,
    required this.amount,
    required this.merchantName,
    required this.transactionName,
  });

  factory QrMpesaResponse.fromModel(QrMpesaResponseModel qrMpesaResponse) {
    return QrMpesaResponse(
      responseCode: qrMpesaResponse.responseCode,
      responseDescription: qrMpesaResponse.responseDescription,
      qrCode: qrMpesaResponse.qrCode,
      amount: qrMpesaResponse.amount,
      merchantName: qrMpesaResponse.merchantName,
      transactionName: qrMpesaResponse.transactionName,
    );
  }
}
