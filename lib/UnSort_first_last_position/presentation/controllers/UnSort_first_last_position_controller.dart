import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnSortedController extends SuperController {
  final TextEditingController unSortedController = TextEditingController();
  final TextEditingController target = TextEditingController();
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
