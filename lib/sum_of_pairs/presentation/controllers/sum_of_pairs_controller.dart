import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SumOfPairController extends SuperController {
  final TextEditingController listController = TextEditingController();
  final TextEditingController sumController = TextEditingController();
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
