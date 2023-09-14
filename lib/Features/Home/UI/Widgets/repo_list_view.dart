import 'package:flutter/material.dart';
import 'package:github_repo_list/Features/Home/Controller/home_conroller.dart';
import 'package:provider/provider.dart';

class RepoListView extends StatelessWidget {
  const RepoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (_, controller, child) {
        final repoDataList = controller.reposListData.items;
        return repoDataList.isNotEmpty
            ? ListView.builder(
                itemCount: repoDataList.length,
                itemBuilder: (_, index) {
                  final repos = repoDataList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    repos.owner!.avatarUrl!,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      repos.owner!.login!,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star_border,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          repos.stargazersCount!.toString(),
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Divider(),
                            Text(
                              repos.fullName!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            repos.description != null
                                ? Text(
                                    repos.description,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
