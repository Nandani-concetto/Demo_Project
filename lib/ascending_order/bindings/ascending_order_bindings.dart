import 'package:get/get.dart';

import '../presentation/controllers/ascending_order_controller.dart';
class AscendingBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>AscendingController());
  }

}