import 'dart:convert';
import 'package:github_repo_list/Models/model_export.dart';
import 'package:github_repo_list/Services/api_services.dart';

abstract class RepoDataRepository {
  Future<ReposList> getReposList(String date);
}

class RepoListData implements RepoDataRepository {
  @override
  Future<ReposList> getReposList(String date) async {
    String jsonResult = await ApiServices().getReposList(date);
    return ReposList.fromJson(json.decode(jsonResult));
  }
}
