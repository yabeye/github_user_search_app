import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
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
                  sizedContainer(
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
                  const SizedBox(),
                  Expanded(
                    child: Container(
                      // width: deviceSize.width * .7,
                      padding: const EdgeInsets.only(left: 8),
                      decoration: const BoxDecoration(
                          // color: Colors.red,
                          ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Yeabsera B.",
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                  Text("@yabeye"),
                                ],
                              ),
                              const Text("Joined march - 1"),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text("Some bio here!"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const GithubStatusCard(),
              const SizedBox(height: 20),
              const MetaInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
