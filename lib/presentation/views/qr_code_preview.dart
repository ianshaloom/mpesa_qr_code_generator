import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../domain/entity/qr_response.dart';

class MpesaQrCodePreview extends StatelessWidget {
  final QrMpesaResponse qrMpesaResponse;
  const MpesaQrCodePreview({super.key, required this.qrMpesaResponse});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(CupertinoIcons.xmark),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('Generated Qr Code',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20),
              Card(
                elevation: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      QrImageView(
                        eyeStyle: QrEyeStyle(
                          eyeShape: QrEyeShape.circle,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        backgroundColor: Colors.white,
                        dataModuleStyle: const QrDataModuleStyle(
                          dataModuleShape: QrDataModuleShape.circle,
                          color: Colors.black,
                        ),
                        data: qrMpesaResponse.qrCode,
                        // size: 800,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        qrMpesaResponse.transactionName,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          'Kshs. ${qrMpesaResponse.amount.toString()}',
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
