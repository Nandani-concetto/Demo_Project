import 'package:get/get.dart';

import '../presentation/controllers/checked_controller.dart';
class CheckedBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>CheckedController());
  }

}