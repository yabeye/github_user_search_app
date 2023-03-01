import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_user_search_app/src/data/models/gihub_user.model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserLoading());

  GithubUser? _githubUser;
  get githubUser => _githubUser;

  Future searchGithubUser({required String githubUsername}) async {
    emit(UserLoading());
    try {
      //ToDO: some api endpoint call here!
      print("Searching $githubUsername");

      await Future.delayed(const Duration(seconds: 3));

      emit(UserLoaded());
    } catch (e) {
      emit(UserError());
    }
    emit(UserLoaded());
  }
}
