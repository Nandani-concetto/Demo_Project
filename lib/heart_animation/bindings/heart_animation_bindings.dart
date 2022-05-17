import 'package:get/get.dart';

import '../presentation/controllers/heart_animation_controller.dart';
class HeartAnimationBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>HeartAnimationController());
  }

}