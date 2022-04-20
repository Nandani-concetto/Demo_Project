import 'package:get/get.dart';

import '../presentation/controllers/add_two_sorted_list_controller.dart';
class AddTwoListBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>AddTwoListController());
  }

}