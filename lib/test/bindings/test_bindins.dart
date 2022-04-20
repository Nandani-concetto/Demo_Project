import 'package:get/get.dart';

import '../presentation/controllers/test_controller.dart';
class TestBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>TestController());
  }

}