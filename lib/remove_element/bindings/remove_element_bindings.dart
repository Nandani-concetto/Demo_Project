import 'package:get/get.dart';

import '../presentation/controllers/remove_element_controller.dart';
class RemoveElementBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>RemoveElementController());
  }

}