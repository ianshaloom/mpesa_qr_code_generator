import 'package:flutter/foundation.dart';

@immutable
class QrMpesaRequest {
  final String paymentTitle;
  final String merchantName;
  final String refNo;
  final int amount;
  final String trxCode;
  final String cpi;
  final String qrSize;

  const QrMpesaRequest({
    required this.paymentTitle,
    required this.merchantName,
    required this.refNo,
    required this.amount,
    required this.trxCode,
    required this.cpi,
    required this.qrSize,
  });

  // to json
  Map<String, dynamic> toJson() {
    return {
      "PaymentTitle": paymentTitle,
      "MerchantName": merchantName,
      "RefNo": refNo,
      "Amount": amount,
      "TrxCode": trxCode,
      "CPI": cpi,
      "Size": qrSize,
    };
  }
}
