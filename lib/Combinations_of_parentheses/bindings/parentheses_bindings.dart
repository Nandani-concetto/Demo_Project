import 'package:get/get.dart';

import '../presentation/controllers/parentheses_controller.dart';
class ParenthesesBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>ParenthesesController());
  }

}