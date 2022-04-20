import 'package:get/get.dart';

import '../presentation/controllers/substring_with_concatenation_controller.dart';
class SubStringWithConcatenationBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>SubStringWithConcatenationController());
  }

}