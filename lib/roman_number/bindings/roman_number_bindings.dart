import 'package:get/get.dart';

import '../presentation/controllers/roman_number_controller.dart';
class RomanBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>RomanController());
  }

}