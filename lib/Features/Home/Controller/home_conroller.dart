import 'package:flutter/material.dart';
import 'package:github_repo_list/Common/util_functions.dart';
import 'package:github_repo_list/Models/model_export.dart';
import 'package:github_repo_list/Repository/repos_list.dart';

class HomeController extends ChangeNotifier {
  ReposList? _reposListData;
  ReposList get reposListData => _reposListData!;

  void initialize() {
    _reposListData = ReposList(
      incompleteResults: true,
      items: [],
      totalCount: 0,
    );
  }

  void getReposData() async {
    UtilMethods util = UtilMethods();
    DateTime date = DateTime.now();
    DateTime newdate = DateTime(date.year, date.month, date.day - 30);
    String fromDate =
        "${newdate.year}-${util.addAtLeft(newdate.month)}-${util.addAtLeft(newdate.day)}";
    RepoDataRepository repoListData = RepoListData();
    _reposListData = await repoListData.getReposList(fromDate);
    notifyListeners();
  }
}
