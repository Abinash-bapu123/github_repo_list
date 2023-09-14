import "package:flutter/material.dart";
import "package:github_repo_list/Features/Home/Controller/home_conroller.dart";
import "package:github_repo_list/Features/Home/UI/Widgets/repo_list_view.dart";
import "package:provider/provider.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<HomeController>().initialize();
    context.read<HomeController>().getReposData();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: RepoListView(),
    );
  }
}
