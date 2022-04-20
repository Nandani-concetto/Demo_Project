import 'package:get/get.dart';

import '../presentation/controllers/zigzag_conversion _controller.dart';
class ZigzagBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>ZigzagController());
  }

}