import 'package:dazzle/model/urls.dart';

class Data {
  List<Result> results;

  Data({required this.results});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      results:
          List<Result>.from(json["results"].map((x) => Result.fromJson(x))));

  Map<String, dynamic> toJson() =>
      {"results": List<dynamic>.from(results.map((x) => x.toJson()))};
}

class Result {
  final String description;
  final String altDescription;
  Urls urls;

  Result(
      {required this.description,
      required this.altDescription,
      required this.urls});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
      description: json["description"] ?? "",
      altDescription: json["alt_description"] ?? "",
      urls: Urls.fromJson(json["urls"]));

  Map<String, dynamic> toJson() => {
        "description": description,
        "alt_description": altDescription,
        "urls": urls.toJson(),
      };
}
