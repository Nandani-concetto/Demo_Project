import 'package:demo_project/login_with_google/presentation/controllers/welcome_controllers.dart';
import 'package:get/get.dart';
class WelcomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>WelcomeController());
  }

}