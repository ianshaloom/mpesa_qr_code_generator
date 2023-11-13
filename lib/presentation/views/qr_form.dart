// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../domain/entity/qr_mpesa_request.dart';
import '../provider/mpesa_qr_code_provider.dart';
import '../widgets/generating_mpesa_qr_loading.dart';
import '../widgets/qr_textformfields.dart';
import 'qr_code_preview.dart';

class QrForm extends StatefulWidget {
  const QrForm({super.key});

  @override
  State<QrForm> createState() => _QrFormState();
}

class _QrFormState extends State<QrForm> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final mercantController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
            Text('New Transaction Qr Code',
                style: Theme.of(context).textTheme.titleLarge),
            Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  NormalTextFormField(
                    controller: titleController,
                    isNumber: false,
                    labelText: 'Payment Title',
                    hintText: 'Enter Payment Title',
                    errorText: 'Please enter payment title',
                    prefixIcon: const Icon(Icons.shopping_bag_outlined),
                  ),
                  const SizedBox(height: 20),
                  NormalTextFormField(
                    controller: mercantController,
                    isNumber: false,
                    labelText: 'Merchant Name',
                    hintText: 'Enter Merchant Name',
                    errorText: 'Please enter merchant name',
                    prefixIcon: const Icon(Icons.shopping_bag_outlined),
                  ),
                  const SizedBox(height: 20),
                  NormalTextFormField(
                    controller: amountController,
                    isNumber: true,
                    labelText: 'Transaction Amount',
                    hintText: 'Enter Transaction Amount',
                    errorText: 'Please enter transaction amount',
                    prefixIcon: const Icon(Icons.money),
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () => _onPressed(context),
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size.fromHeight(60),
                    ),
                    child: const Text(
                      'Add Product',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // generate a string of random characters of length 10
  String generateRefNo() {
    var random = Random.secure();
    var values = List<int>.generate(10, (i) => random.nextInt(255));
    String refNo = base64Url.encode(values);

    return refNo;
  }

  Future _onPressed(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final String refNo = generateRefNo();
      print('refNo: $refNo');
      final String paymentTitle = titleController.text.trim();
      final String merchantName = mercantController.text.trim();
      final int amount = double.parse(amountController.text.trim()).round();

      final QrMpesaRequest qrMpesaRequest = QrMpesaRequest(
        paymentTitle: paymentTitle,
        merchantName: merchantName,
        refNo: refNo,
        amount: amount,
        trxCode: trxCodeRequest,
        cpi: cpiRequest,
        qrSize: qrSizeRequest,
      );

      MpesaQrCodeProvider.qrMpesaRequest = qrMpesaRequest;

      await showDialog(
        barrierColor: Colors.black38,
        context: context,
        barrierDismissible: false,
        builder: (_) => const GeneratingQrProgress(),
      ).then((value) {
        Navigator.of(context).pop();

        if (MpesaQrCodeProvider.qrMpesaResponse.responseCode == '00') {
          showDialog(
            barrierColor: Colors.black38,
            context: context,
            barrierDismissible: false,
            builder: (_) => MpesaQrCodePreview(
                qrMpesaResponse: MpesaQrCodeProvider.qrMpesaResponse),
          );
        }
      });
      // _clearTextFields();
      // Navigator.of(context).pop();
    }
  }

  void _clearTextFields() {
    titleController.clear();
    mercantController.clear();
    amountController.clear();
  }
}
