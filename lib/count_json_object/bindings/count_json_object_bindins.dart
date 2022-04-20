import 'package:get/get.dart';

import '../presentation/controllers/count_json_object_controller.dart';
class CountJsonObjectBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>CountJsonObjectController());
  }

}