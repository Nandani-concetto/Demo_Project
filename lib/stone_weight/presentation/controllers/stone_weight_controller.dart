import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoneController extends SuperController {
  final TextEditingController stoneController = TextEditingController();
  RxList outputList = [].obs;

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
