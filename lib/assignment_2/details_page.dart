import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String data;
  const DetailsPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Recieved: $data', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Thanks from Details!');
              },
              child: const Text('Send data back'),
            ),
          ],
        ),
      ),
    );
  }
}
