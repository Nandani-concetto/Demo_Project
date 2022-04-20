import 'package:get/get.dart';
import '../presentation/controllers/social_login_controller.dart';
class SocialLoginBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>SocialLoginController());
  }

}