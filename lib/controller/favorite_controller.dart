import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:hive/hive.dart';

import '../model/wallpaper.dart';

class FavoriteController extends BaseControlle {
  Box<Wallpaper>? favbox;

  @override
  void onInit() {
    favbox = Hive.box<Wallpaper>(favoriteHiveBox);
    super.onInit();
  }
}
