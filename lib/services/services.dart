import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:http/http.dart' as http;

class Services {
  List<Result> characters = [];
  int currentPage = 1;
  int id = 1;
  Future<bool> getAllData(String urlLink) async {
    final Uri url = Uri.parse(urlLink);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = heroModelFromJson(response.body);
      characters = result.results;
      for (var i = 0; i < characters.length; i++) {
        print("NextPage:" + result.info.next);
        if (result.info.prev != null) print("PrevPage:" + result.info.prev);
        print("Count:" + result.info.count.toString());
        print("Pages:" + result.info.pages.toString());

        print("------------------------------------------------");

        print("Id:" + result.results[i].id.toString());
        print("Name:" + result.results[i].name);
        print("Status:" + result.results[i].status);
        print("Species:" + result.results[i].species);
        if (result.results[i].type != null)
          print("Type:" + result.results[i].type);
        print("Gender:" + result.results[i].gender);
        print("Origin:" + result.results[i].origin.name);
        print("Location:" + result.results[i].location.name);
        print("Image:" + result.results[i].image);
        print("------------------------------------------------");
      }
      currentPage++;
      return true;
    } else {
      return false;
    }
  }
}
