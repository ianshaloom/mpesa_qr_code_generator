import 'package:flutter/foundation.dart';

import '../../domain/entity/qr_mpesa_request.dart';

@immutable
class QrMpesaResponseModel{
  final String responseCode;
  final String responseDescription;
  final String qrCode;
  final int amount;
  final String merchantName;
  final String transactionName;

  const QrMpesaResponseModel({
    required this.responseCode,
    required this.responseDescription,
    required this.qrCode,
    required this.amount,
    required this.merchantName,
    required this.transactionName,
  });

  factory QrMpesaResponseModel.fromJson(Map<String, dynamic> json, QrMpesaRequest qrMpesaRequest){
    return QrMpesaResponseModel(
      responseCode: json['ResponseCode'],
      responseDescription: json['ResponseDescription'],
      qrCode: json['QRCode'],
      amount: qrMpesaRequest.amount,
      merchantName: qrMpesaRequest.merchantName,
      transactionName: qrMpesaRequest.paymentTitle,
    );
  }
}