import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZigzagController extends SuperController {
  final TextEditingController zigzagController = TextEditingController();
  final TextEditingController numberOfRowController = TextEditingController();
  RxList output = [].obs;


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
