import 'package:get/get.dart';

import '../presentation/controllers/check_parentheses_controller.dart';
class CheckParenthesesBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>CheckParenthesesController());
  }

}