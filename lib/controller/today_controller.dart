import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/services/rest_api.dart';
import 'package:dazzle/view/utils/constant/const.dart';
import 'package:flutter/cupertino.dart';

class TodayController extends BaseControlle {
  final _restobj = RestApi();
  final ScrollController todaycontroller = ScrollController();
  List<Wallpaper> todaylist = [];
  int todaypage = 2;
  Future<void> getListofToday() async {
    try {
      setstate(true);
      todaylist = await _restobj
          .convertJsonToObject(api + order + latest + page + '${1}');
      setstate(false);
    } catch (e) {
      //print(e);
    }
  }

  void loadmoredata() {
    try {
      todaycontroller.addListener(() async {
        if (todaycontroller.position.pixels ==
            todaycontroller.position.maxScrollExtent) {
          await adddatatodaylist();
        }
      });
    } catch (e) {
      //print(e);
    }
  }

  Future<void> adddatatodaylist() async {
    try {
      setLoading(true);
      todaylist.addAll(await _restobj
          .convertJsonToObject(api + order + latest + '$page $todaypage'));
      todaypage++;
      setLoading(false);
      update();
    } catch (e) {
      //print(e);
    }
  }

  @override
  void onInit() {
    getListofToday();
    loadmoredata();
    {
      super.onInit();
    }
  }

  // @override
  // void onClose() {
  //   todaycontroller.dispose();
  //   super.onClose();
  // }
}
