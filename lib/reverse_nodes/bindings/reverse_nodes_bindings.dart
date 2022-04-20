import 'package:get/get.dart';

import '../presentation/controllers/reverse_nodes_controller.dart';
class ReverseNodeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>ReverseNodeController());
  }

}