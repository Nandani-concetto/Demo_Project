import 'package:get/get.dart';

import '../presentation/controllers/sum_of_pair_validation_controller.dart';
class SumOfListBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>SumOfListController());
  }

}