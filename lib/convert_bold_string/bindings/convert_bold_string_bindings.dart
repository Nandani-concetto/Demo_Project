import 'package:get/get.dart';

import '../presentation/controllers/convert_bold_string_controller.dart';
class BoldStringBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>BoldStringController());
  }

}