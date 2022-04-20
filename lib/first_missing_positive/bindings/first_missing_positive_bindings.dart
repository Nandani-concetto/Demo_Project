import 'package:get/get.dart';

import '../presentation/controllers/first_missing_positive_controller.dart';
class FirstMissingPositiveBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>FirstMissingPositiveController());
  }

}