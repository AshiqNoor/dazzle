import 'package:dazzle/model/urls.dart';
import 'package:hive/hive.dart';
part 'result.g.dart';

@HiveType(typeId: 35)
class Result {
  @HiveField(35)
  String description;
  @HiveField(36)
  String altDescription;
  @HiveField(37)
  Urls urls;

  Result({
    required this.urls,
    required this.description,
    required this.altDescription,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        description: json["description"] ?? "",
        altDescription: json["alt_description"] ?? "",
        urls: Urls.fromJson(json["urls"]),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "alt_description": altDescription,
        "urls": urls.toJson(),
      };
}
