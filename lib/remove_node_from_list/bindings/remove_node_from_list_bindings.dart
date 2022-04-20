import 'package:get/get.dart';

import '../presentation/controllers/remove_node_from_list_controller.dart';
class RemoveNodeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>RemoveNodeController());
  }

}