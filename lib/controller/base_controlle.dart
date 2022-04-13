import 'package:get/get.dart';

class BaseControlle extends GetxController {
  bool _state = false;
  bool get state => _state;
  void setstate(bool value) {
    _state = value;
    update();
  }
}
