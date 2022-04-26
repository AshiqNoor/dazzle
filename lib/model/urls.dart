import 'package:hive/hive.dart';
part 'urls.g.dart';

@HiveType(typeId: 20)
class Urls {
  Urls({
    required this.regular,
    required this.small,
  });
  @HiveField(20)
  String regular;
  @HiveField(21)
  String small;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        regular: json["regular"],
        small: json["small"],
      );

  Map<String, dynamic> toJson() => {
        "regular": regular,
        "small": small,
      };
}
