import 'package:flutter/material.dart';

import '../provider/mpesa_qr_code_provider.dart';

class GeneratingQrProgress extends StatefulWidget {
  const GeneratingQrProgress({super.key});

  @override
  State<GeneratingQrProgress> createState() => _GeneratingQrProgressState();
}

class _GeneratingQrProgressState extends State<GeneratingQrProgress> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      initialData: 'Please wait...',
      stream: MpesaQrCodeProvider().gettingQrCodeData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            String progress = snapshot.data!;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 75,
                  width: 75,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  progress,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 75,
                  width: 75,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Error: ${snapshot.error}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                ),
                // pop the dialog
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 75,
                  width: 75,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Almost there ...',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                ),
              ],
            );
          }
        } else if (snapshot.connectionState == ConnectionState.done) {
          Navigator.pop(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 75,
                width: 75,
                child: CircularProgressIndicator(
                  value: 1,
                  color: Theme.of(context).colorScheme.primary,
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Done',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
              ),
            ],
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 75,
                width: 75,
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Fetching Data...',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
              ),
            ],
          );
        }
      },
    );
  }

  Stream<int> get stream => Stream.periodic(
        const Duration(milliseconds: 100),
        (i) => i,
      ).take(100);
}
