import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RomanController extends SuperController {
  final TextEditingController romanController = TextEditingController();

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
