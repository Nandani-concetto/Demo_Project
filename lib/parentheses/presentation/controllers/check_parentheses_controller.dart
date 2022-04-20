import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckParenthesesController extends SuperController {
  final TextEditingController parenthesesController = TextEditingController();
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
