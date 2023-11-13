import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../domain/entity/qr_mpesa/mpesa_qr_code.dart';

class MpesaQrCodeCard extends StatelessWidget {
  final MpesaQrCode qrCode;
  const MpesaQrCodeCard({super.key, required this.qrCode});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              data: qrCode.qrCodeData,
              size: MediaQuery.of(context).size.width * 0.6,
            ),
            const SizedBox(height: 30),
            Text(
              qrCode.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                'Kshs. ${qrCode.amount.toString()}',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
