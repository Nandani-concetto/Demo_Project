import 'package:get/get.dart';

import '../presentation/controllers/sum_of_pairs_controller.dart';
class SumOfPairBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>SumOfPairController());
  }

}