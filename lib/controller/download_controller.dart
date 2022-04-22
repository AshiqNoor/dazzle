import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DownloadController extends BaseControlle {
  Box<String>? downloadbox;
//save the url and file path of the wallpaper to the HIve box
  void getimagepath({String? url, String? path}) {
    var box = Hive.box<String>(downloadHiveBox);
    box.put(url, path!);
  }

  @override
  void onInit() {
    downloadbox = Hive.box<String>(downloadHiveBox);
    super.onInit();
  }
}
