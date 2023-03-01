import 'package:cached_network_image/cached_network_image.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
    final Size deviceSize = MediaQuery.of(context).size;
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: deviceSize.width * 1,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search Github username",
                      prefixIcon: Icon(Icons.search),
                      suffix: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.blue,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _sizedContainer(
                    ClipRRect(
                      borderRadius: BorderRadius.circular(300.0),
                      child: CachedNetworkImage(
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                        imageUrl:
                            'https://avatars.githubusercontent.com/u/88554326?v=4',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _sizedContainer(Widget child) {
  return SizedBox(
    width: 80.0,
    height: 80.0,
    child: Center(child: child),
  );
}
