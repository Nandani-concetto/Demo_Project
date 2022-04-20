import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestController extends SuperController {
  final TextEditingController numberController = TextEditingController(text: "0");
  final TextEditingController testController = TextEditingController();
  RxInt outputList = 0.obs;
  RxInt dropdownValue=1.obs;

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
