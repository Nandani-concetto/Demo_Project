import 'package:get/get.dart';

import '../presentation/controllers/first_and_last_position_controller.dart';
class FirstAndLastPositionBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>FirstAndLastPositionController());
  }

}