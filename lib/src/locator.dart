import 'package:get_it/get_it.dart';
import 'package:github_user_search_app/src/data/repo/user.repository.dart';

import 'data/http/api_service.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerSingleton<ApiService>(
    ApiService(),
  );
  locator.registerSingleton<GithubUserRepo>(
    GithubUserRepo(),
  );
}
