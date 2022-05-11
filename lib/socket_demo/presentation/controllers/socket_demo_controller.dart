import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;


class SocketController extends SuperController {
  late  TextEditingController nameController = TextEditingController();
  late TextEditingController messageController=TextEditingController();
  late ScrollController controller;
  //late IO.Socket socket;
@override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();

}
@override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }
  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }

}
