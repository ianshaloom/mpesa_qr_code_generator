import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../domain/entity/qr_mpesa_request.dart';
import '../model/qr_response_model.dart';
import 'qr_code_mpesa_generate_ds.dart';

class QrCodeMpesaGenerateRemoteDs implements QrCodeMpesaGenerateDs {
  @override
  Future<QrMpesaResponseModel> getMpesaQrCode(
      String accessToken, QrMpesaRequest qrMpesaRequest) async {
    //
    final String body = json.encode({
      "MerchantName": qrMpesaRequest.merchantName,
      "RefNo": qrMpesaRequest.refNo,
      "Amount": qrMpesaRequest.amount,
      "TrxCode": qrMpesaRequest.trxCode,
      "CPI": qrMpesaRequest.cpi,
      "Size": qrMpesaRequest.qrSize,
    });

    try {
      final http.Response response = await http.post(
        Uri.parse(qrGenerateUrl),
        headers: {
          "Authorization": "Bearer $accessToken",
          'Content-Type': 'application/json',
        },
        body: body,
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to generate QR code');
      }

      final QrMpesaResponseModel qrMpesaResponseModel =
          QrMpesaResponseModel.fromJson(
              json.decode(response.body) as Map<String, dynamic>,
              qrMpesaRequest);

      print('========> ${qrMpesaResponseModel.responseCode}');
      return qrMpesaResponseModel;
    } catch (_) {
      throw Exception('Failed to generate QR code');
    }
  }
}

  // String generateTimestamp(DateTime now) {
  //   return "${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}";
  // }