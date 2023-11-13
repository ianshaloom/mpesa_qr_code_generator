import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants.dart';
import 'qr_code_mpesa_auth_ds.dart';

class QrCodeMpesaAuthRemoteDs implements QrCodeMpesaAuthDs {
  @override
  Future<String> getAuthToken() async {
    try {
      final http.Response response = await http.get(
        Uri.parse(authUrl),
        headers: {
          "Authorization": "Basic $token",
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to authenticate with Mpesa API');
      }

      final data = json.decode(response.body);
      final String accessToken = data["access_token"].toString();
      print('accessToken: $accessToken');

      return accessToken;
    } catch (e) {
      throw Exception('Failed to authenticate with Mpesa API: $e');
    }
  }
}
