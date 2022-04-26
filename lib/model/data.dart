import 'package:dazzle/model/result.dart';
import 'package:hive/hive.dart';
part 'data.g.dart';

@HiveType(typeId: 30)
class Data {
  @HiveField(30)
  List<Result> results;

  Data({required this.results});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      results:
          List<Result>.from(json["results"].map((x) => Result.fromJson(x))));

  Map<String, dynamic> toJson() =>
      {"results": List<dynamic>.from(results.map((x) => x.toJson()))};
}
