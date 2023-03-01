import 'package:flutter/material.dart';

void main() {
  runApp(const WhalesApp());
}

class WhalesApp extends StatelessWidget {
  const WhalesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whales App',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: const Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('devfinder'),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.light_mode),
                label: const Text('light'))
          ],
        ),
      ),
    );
  }
}
