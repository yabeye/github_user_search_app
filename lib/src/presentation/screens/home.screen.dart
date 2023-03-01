import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_user_search_app/src/data/models/gihub_user.model.dart';
import 'package:github_user_search_app/src/logic/cubits/user/user_cubit.dart';

import '../widgets/widgets.dart';

import '../../utils/date_formatter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _onInit = true;
  TextEditingController? _searchKeyController;

  @override
  void initState() {
    super.initState();
    _searchKeyController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    if (_onInit) {
      context.read<UserCubit>().searchGithubUser(githubUsername: "octocat");
    }
    _onInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _searchKeyController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, userState) {
              if (userState is UserLoading) {
                return const Loading();
              }
              debugPrint("User State: $userState");
              final githubUser = context.read<UserCubit>().githubUser;
              if (userState is UserLoaded && githubUser != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: deviceSize.width * 1,
                      child: TextField(
                        controller: _searchKeyController,
                        decoration: InputDecoration(
                            hintText: "Search Github username",
                            prefixIcon: const Icon(Icons.search),
                            suffix: TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.blue,
                                ),
                              ),
                              onPressed: () {
                                context.read<UserCubit>().searchGithubUser(
                                    githubUsername: _searchKeyController!.text);
                              },
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
                              progressIndicatorBuilder:
                                  (context, url, progress) => Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                              imageUrl: githubUser.avatarUrl ?? '',
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          githubUser.name ?? githubUser.login,
                                          style: const TextStyle(
                                            fontSize: 22,
                                          ),
                                        ),
                                        Text("@${githubUser.login}"),
                                      ],
                                    ),
                                    Text(
                                        "Joined ${formateMyDate(githubUser.createdAt)}"),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Text(
                                    githubUser.bio ??
                                        'This profile has no bio!',
                                    style: TextStyle(
                                      color: githubUser.bio == null
                                          ? Colors.grey
                                          : Colors.white,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GithubStatusCard(githubUser: githubUser),
                    const SizedBox(height: 20),
                    MetaInfo(
                      githubUser: githubUser,
                    ),
                  ],
                );
              }

              return const Center(
                child: Text("Some error here!"),
              );
            },
          ),
        ),
      ),
    );
  }
}
