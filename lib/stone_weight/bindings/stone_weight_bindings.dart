import 'package:get/get.dart';

import '../presentation/controllers/stone_weight_controller.dart';
class StoneBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>StoneController());
  }

}