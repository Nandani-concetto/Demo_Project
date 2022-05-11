import 'package:get/get.dart';

import '../presentation/controllers/login_controllers.dart';
class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>LoginController());
  }

}