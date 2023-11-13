import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/entity/qr_mpesa/mpesa_qr_code.dart';
import '../../hive/hive_boxes.dart';
import '../widgets/mpesa_qr_code_card.dart';
import 'qr_form.dart';

class QrMpesaPage extends StatelessWidget {
  const QrMpesaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            backgroundColor: Theme.of(context).colorScheme.surface,
            title: const Text('QR Mpesa Generator'),
            titleTextStyle: textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 28,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: ValueListenableBuilder(
              valueListenable: Hiveboxes.mpesaQrCodesBox.listenable(),
              builder: (context, box, _) {
                if (box.values.isEmpty) {
                  return const SliverFillRemaining(
                    child: Center(
                      child: Text('No QR code generated yet'),
                    ),
                  );
                } else {
                  final List<MpesaQrCode> qrCodes =
                      box.values.toList().cast<MpesaQrCode>();

                  return SliverList.builder(
                    itemCount: qrCodes.length,
                    itemBuilder: (context, index) {
                      return MpesaQrCodeCard(qrCode: qrCodes[index]);
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showQrForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future _showQrForm(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) => const QrForm(),
    );
  }
}
