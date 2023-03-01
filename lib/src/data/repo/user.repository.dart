import 'package:github_user_search_app/src/data/http/api_service.dart';
import 'package:github_user_search_app/src/locator.dart';

abstract class UserRepo {}

class GithubUserRepo implements UserRepo {
  GithubUserRepo({ApiService? apiService})
      : _apiService = apiService ?? locator.get<ApiService>();

  final ApiService _apiService;

  Future fetchGithubUsersData({required String username}) async {
    return await _apiService.get(endpoint: username);
  }
}
