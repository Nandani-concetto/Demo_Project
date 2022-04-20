import 'package:get/get.dart';

import '../presentation/controllers/swap_node_of_list_controller.dart';
class SwapNodeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>SwapNodeController());
  }

}