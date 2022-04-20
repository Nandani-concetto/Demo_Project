import 'package:get/get.dart';

import '../presentation/controllers/UnSort_first_last_position_controller.dart';
class UnSortedBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>UnSortedController());
  }

}