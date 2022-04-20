import 'package:get/get.dart';

import '../presentation/controllers/count_duplicate_value_controller.dart';
class DuplicateBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>DuplicateController());
  }

}