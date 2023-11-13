import 'package:flutter/material.dart';

import 'presentation/views/qr_mpesa_page.dart';

class QrMpesa extends StatelessWidget {
  const QrMpesa({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Mpesa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const QrMpesaPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
