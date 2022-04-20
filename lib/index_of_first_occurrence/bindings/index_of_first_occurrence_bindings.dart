import 'package:get/get.dart';

import '../presentation/controllers/index_of_first_occurrence_controller.dart';
class IndexOfFirstOccurrenceBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>IndexOfFirstOccurrenceController());
  }

}