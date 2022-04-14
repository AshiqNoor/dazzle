import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DownloadController extends BaseControlle {
  Future<void> getimagepath({String? url, String? path}) async {
    var box = await Hive.openBox<String>(downloadBox);
    box.put(url, path!);
    box.close();
  }
}
