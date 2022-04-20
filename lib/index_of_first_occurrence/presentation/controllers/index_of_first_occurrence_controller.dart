import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexOfFirstOccurrenceController extends SuperController {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  RxList output = [].obs;
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
