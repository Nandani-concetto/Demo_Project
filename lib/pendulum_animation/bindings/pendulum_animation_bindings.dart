import 'package:get/get.dart';

import '../presentation/controllers/pendulum_animation_controller.dart';
class PendulumAnimationBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>PendulumAnimationController());
  }

}