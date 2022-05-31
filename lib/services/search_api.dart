import 'dart:convert';
import 'package:dazzle/model/result.dart';
import 'package:http/http.dart' as http;

import '../model/data.dart';

class SearchApi {
  Future<dynamic> getjsonFromApi(url) async {
    try {
      var uri = Uri.parse(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        var parsejson = jsonDecode(response.body) as dynamic;
        return parsejson;
        //print(parsejson);
      } else {
        //  print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    }
  }

  Future<List<Result>> convertsearchJsonToObject(String url) async {
    var list = (await getjsonFromApi(url));
    var data = Data.fromJson(list);
    List<Result> results = [];
    results = data.results;

    return results;
  }
}
