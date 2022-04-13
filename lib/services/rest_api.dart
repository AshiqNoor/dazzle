import 'dart:convert';

import 'package:dazzle/model/wallpaper.dart';

import 'package:http/http.dart' as http;

class RestApi {
  Future<List<dynamic>> getjsonFromApi(String url) async {
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var parsejson = jsonDecode(response.body) as List<dynamic>;
    // print(parsejson);
    //List<dynamic> list = parsejson;
    // List<Wallpaper> wallpapers = [];
    // for (var wallpaper in parsejson) {
    //   wallpapers.add(Wallpaper.fromJson(wallpaper));
    // }
    return parsejson;
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
