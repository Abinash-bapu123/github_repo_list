import 'package:flutter/material.dart';
import 'package:github_repo_list/Common/provider_list.dart';
import 'package:github_repo_list/Config/app_colors.dart';
import 'package:github_repo_list/Features/features_export.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProvidersList.providers,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Repo List"),
            backgroundColor: AppColors.appPrimaryColor,
          ),
          backgroundColor: AppColors.appSecondaryColor,
          body: const Home(),
        ),
      ),
    );
  }
}
