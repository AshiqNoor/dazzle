import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/services/rest_api.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:flutter/cupertino.dart';

class HomeController extends BaseControlle {
  final _restobj = RestApi();
  final ScrollController todaycontroller = ScrollController();
  List<Wallpaper> todaylist = [];
  int todaypage = 2;
  Future<void> getListofToday() async {
    setstate(true);
    todaylist =
        await _restobj.convertJsonToObject(api + "&page=${1}&order_by=latest");
    setstate(false);
  }

  void loadmoredata() {
    todaycontroller.addListener(() async {
      if (todaycontroller.position.pixels ==
          todaycontroller.position.maxScrollExtent) {
        await adddatatodaylist();
      }
    });
  }

  Future<void> adddatatodaylist() async {
    setLoading(true);
    todaylist.addAll(await _restobj
        .convertJsonToObject(api + "&page=$todaypage&order_by=latest"));
    todaypage++;
    setLoading(false);
    update();
  }

  @override
  void onInit() {
    getListofToday();
    loadmoredata();
    {
      super.onInit();
    }
  }
}
