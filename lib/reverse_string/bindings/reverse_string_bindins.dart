import 'package:get/get.dart';

import '../presentation/controllers/reverse_string_controller.dart';
class ReverseBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>ReverseController());
  }

}