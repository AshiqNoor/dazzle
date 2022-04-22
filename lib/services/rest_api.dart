import 'dart:convert';
import 'package:dazzle/model/wallpaper.dart';
import 'package:http/http.dart' as http;

class RestApi {
  var parsejson = [];
  Future<List<dynamic>> getjsonFromApi(String url) async {
    var uri = Uri.parse(url);
    final response = await http.get(uri);
    try {
      if (response.statusCode == 200) {
        parsejson = jsonDecode(response.body) as List<dynamic>;

        //print(parsejson);
      } else {
        //  print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    }
    return parsejson;

    //List<dynamic> list = parsejson;
    // List<Wallpaper> wallpapers = [];
    // for (var wallpaper in parsejson) {
    //   wallpapers.add(Wallpaper.fromJson(wallpaper));
    // }
  }

  Future<List<Wallpaper>> convertJsonToObject(String url) async {
    List<dynamic> list = (await getjsonFromApi(url));
    List<Wallpaper> wallpapers = [];
    for (var wallpaper in list) {
      wallpapers.add(Wallpaper.fromJson(wallpaper));
    }
    return wallpapers;
  }
}
