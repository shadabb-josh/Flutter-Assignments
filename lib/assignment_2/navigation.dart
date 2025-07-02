import 'package:assignments/assignment_2/details_page.dart';
import 'package:flutter/material.dart';

class NavigationHomePage extends StatefulWidget {
  const NavigationHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _NavigationHomePageState();
}

class _NavigationHomePageState extends State<NavigationHomePage> {
  String returnedData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Returned: $returnedData',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const DetailsPage(data: 'Hello from Home!'),
                  ),
                );
                if (result != null) {
                  setState(() {
                    returnedData = result;
                  });
                }
              },
              child: const Text('Go to Details'),
            ),
          ],
        ),
      ),
    );
  }
}
