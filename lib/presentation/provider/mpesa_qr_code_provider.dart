import 'package:flutter/material.dart';

import '../../data/datasource/qr_code_mpesa_auth_ds.dart';
import '../../data/datasource/qr_code_mpesa_auth_remote_ds.dart';
import '../../data/datasource/qr_code_mpesa_generate_ds.dart';
import '../../data/datasource/qr_code_mpesa_generate_remote_ds.dart';
import '../../data/repo/qr_code_auth_repo_impl.dart';
import '../../data/repo/qr_code_generate_repo_impl.dart';
import '../../domain/entity/qr_mpesa_request.dart';
import '../../domain/entity/qr_response.dart';
import '../../domain/repo/qr_code_auth_repo.dart';
import '../../domain/repo/qr_code_generate_repo.dart';
import 'mpesa_qr_code_mixin.dart';

class MpesaQrCodeProvider extends ChangeNotifier with MpesaQrCodeMixin {
  static final QrCodeMpesaAuthDs datasource = QrCodeMpesaAuthRemoteDs();
  final QrMpesaAuthRepo repo = QrMpesaAuthRepoImpl(qrMpesaAuthDs: datasource);

  static QrCodeMpesaGenerateDs datasourceGenerate =
      QrCodeMpesaGenerateRemoteDs();
  final MpesaQrCodeGenerateRepo generateRepo = QrCodeGenerateRepoImpl(
    datasourceGenerate,
  );
  static late QrMpesaRequest qrMpesaRequest;
  static late String accessToken;
  static late QrMpesaResponse qrMpesaResponse;

  Stream<String> gettingQrCodeData() async* {
    yield 'Generating QR Code...';
    await getQrMpesaAuth(repo).then((value) => accessToken = value);
    yield 'Almost done...';
    await getMpesaQrCode(generateRepo, accessToken, qrMpesaRequest)
        .then((value) => qrMpesaResponse = value);
    yield 'Done!';
    await Future.delayed(const Duration(seconds: 2));
  }

  MpesaQrCodeProvider._();
  static final MpesaQrCodeProvider _instance = MpesaQrCodeProvider._();
  factory MpesaQrCodeProvider() => _instance;
}
