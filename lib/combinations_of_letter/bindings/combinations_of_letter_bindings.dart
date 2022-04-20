import 'package:get/get.dart';

import '../presentation/controllers/combinations_of_letters_controller.dart';
class LetterCombinationsBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>LetterCombinationsController());
  }

}