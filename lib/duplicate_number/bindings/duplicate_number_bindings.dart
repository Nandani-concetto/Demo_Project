import 'package:get/get.dart';

import '../presentation/controllers/duplicate_number_controller.dart';
class DuplicateNumberBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>DuplicateNumberController());
  }

}