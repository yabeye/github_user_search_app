import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_user_search_app/src/data/models/gihub_user.model.dart';
import 'package:github_user_search_app/src/data/repo/user.repository.dart';
import 'package:github_user_search_app/src/locator.dart';
import 'package:http/http.dart' as http;

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoading());

  // UserCubit({GithubUserRepo? githubUserRepo})
  //     : _githubUserRepo = githubUserRepo ?? locator.get<GithubUserRepo>(),
  //       super(UserLoading());

  final GithubUserRepo _githubUserRepo = GithubUserRepo();

  GithubUser? _githubUser;
  GithubUser? get githubUser => _githubUser;

  Future searchGithubUser({required String githubUsername}) async {
    emit(UserLoading());
    _githubUserRepo
        .fetchGithubUsersData(username: githubUsername)
        .then((value) {
      _githubUser = GithubUser.fromJson(value);
      print("Github user is ${githubUser!.name}");
      emit(UserLoaded());
    }).catchError((_) {
      emit(UserError());
    });
  }
}
