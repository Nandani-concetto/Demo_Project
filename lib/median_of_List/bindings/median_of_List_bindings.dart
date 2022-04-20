import 'package:get/get.dart';

import '../presentation/controllers/median_of_List_controller.dart';
class MedianOfListBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>MedianOfListController());
  }

}