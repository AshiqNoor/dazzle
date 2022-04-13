import 'package:dazzle/controller/base_controlle.dart';
import 'package:dazzle/model/wallpaper.dart';
import 'package:dazzle/services/rest_api.dart';
import 'package:dazzle/view/utils/constant/const.dart';

class HomeController extends BaseControlle {
  final _restobj = RestApi();
  List<Wallpaper> todaylist = [];
  List<Wallpaper> popularlist = [];
  List<Wallpaper> oldestlist = [];
  getListofToday() async {
    setstate(true);
    todaylist = await _restobj
        .convertJsonToObject(api + "&page=${1}" + "&order_by=latest");
    setstate(false);
  }

  void getListofPopular() async {
    setstate(true);
    popularlist = await _restobj
        .convertJsonToObject(api + "&page=${1}" + "&order_by=popular");
    setstate(false);
  }

  void getListofOldest() async {
    setstate(true);
    oldestlist =
        await _restobj.convertJsonToObject(api + "&page=${1}&order_by=oldest");
    setstate(false);
  }

  @override
  void onInit() {
    getListofToday();
    getListofPopular();
    getListofOldest();
    {
      super.onInit();
    }
  }
}
