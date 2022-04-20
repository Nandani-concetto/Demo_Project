import 'package:get/get.dart';

import '../presentation/controllers/list_of_pages_controller.dart';
class ListOfPagesBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>ListOfPagesController());
  }

}