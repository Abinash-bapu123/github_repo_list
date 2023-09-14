import 'package:http/http.dart' as http;

class ApiServices {
  Future<String> getReposList(String date) async {
    final response = await http.get(
      Uri.parse(
          "https://api.github.com/search/repositories?q=created:>$date&sort=stars&order=desc"),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "error";
    }
  }
}
