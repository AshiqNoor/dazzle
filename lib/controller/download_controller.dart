import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DownloadController extends BaseControlle {
  getimagepath({String? url, String? path}) {
    var box = Hive.box<String>(downloadHiveBox);
    box.put(url, path!);
    box.close();
  }
}
