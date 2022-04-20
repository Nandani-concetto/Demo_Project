import 'package:get/get.dart';

import '../presentation/controllers/longest_common_prefix_controller.dart';
class LongestCommonPrefixBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>LongestCommonPrefixController());
  }

}