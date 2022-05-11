import 'package:get/get.dart';

import '../presentation/controllers/socket_demo_controller.dart';
class SocketBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() =>SocketController());
  }

}