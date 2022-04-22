import 'dart:convert';
import 'package:dazzle/model/result.dart';
import 'package:http/http.dart' as http;

class SearchApi {
  Future<dynamic> fetchData(url) async {
    var uri = Uri.parse(url);
    final response = await http.get(uri);
    // var url =
    //     'https://unsplash.com/napi/search/photos?query=$keyword&xp=&per_page=50&page=1';
    // var responseApi = await http.get(Uri.parse(url));

    var resJSON = json.decode(response.body);
    var data = Data.fromJson(resJSON);

    return data;
  }

  Future<List<Result>> convertsearchJsonToObject(String url) async {
    var list = (await fetchData(url)).results;
    List<Result> results = [];
    results = list;

    return results;
  }
  // Future<List<Result>> convertsearchJsonToObject(String url) async {
  //   var data = (await getsearchjsonFromApi(url));
  //   List<Result> _data = [];
  //   _data = data.results;
  //   return _data;
  // }
}
