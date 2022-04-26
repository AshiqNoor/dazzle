import 'dart:convert';
import 'package:dazzle/model/result.dart';
import 'package:http/http.dart' as http;

import '../model/data.dart';

class SearchApi {
  // ignore: prefer_typing_uninitialized_variables
  var parsejson;
  Future<dynamic> getjsonFromApi(url) async {
    var uri = Uri.parse(url);
    final response = await http.get(uri);
    try {
      if (response.statusCode == 200) {
        parsejson = jsonDecode(response.body) as dynamic;

        //print(parsejson);
      } else {
        //  print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      // print(e);
    }
    return parsejson;
  }

  Future<List<Result>> convertsearchJsonToObject(String url) async {
    var list = (await getjsonFromApi(url));
    var data = Data.fromJson(list);
    List<Result> results = [];
    results = data.results;

    return results;
  }
  // Future<List<Result>> convertsearchJsonToObject(String url) async {
  //   var data = (await getsearchjsonFromApi(url));
  //   List<Result> _data = [];
  //   _data = data.results;
  //   return _data;
  // }
}
