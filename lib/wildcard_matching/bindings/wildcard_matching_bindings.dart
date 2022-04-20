import 'package:get/get.dart';

import '../presentation/controllers/wildcard_matching_controller.dart';
class WildcardBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>WildcardController());
  }

}