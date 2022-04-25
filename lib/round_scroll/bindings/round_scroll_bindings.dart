import 'package:get/get.dart';

import '../presentation/controllers/round_scroll_controller.dart';
class RoundScrollBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>RoundScrollController());
  }

}