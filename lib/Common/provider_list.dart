import 'package:github_repo_list/Features/Home/Controller/home_conroller.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

class ProvidersList {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<HomeController>(create: (_) => HomeController()),
  ];
}
