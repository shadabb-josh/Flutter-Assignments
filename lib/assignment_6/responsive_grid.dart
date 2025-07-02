import 'package:flutter/material.dart';

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final crossAxisCount = isLandScape ? 4 : 2;

    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Grid')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Item ${index + 1}',
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
