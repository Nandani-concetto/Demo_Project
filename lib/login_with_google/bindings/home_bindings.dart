import 'package:demo_project/login_with_google/presentation/controllers/home_controllers.dart';
import 'package:get/get.dart';
class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>HomeController());
  }

}