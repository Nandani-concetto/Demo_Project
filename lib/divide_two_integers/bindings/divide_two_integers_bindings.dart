import 'package:get/get.dart';

import '../presentation/controllers/divide_two_integers_controller.dart';
class DivideBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>DivideController());
  }

}