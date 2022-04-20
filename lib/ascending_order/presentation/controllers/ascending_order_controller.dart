import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AscendingController extends SuperController {
  final TextEditingController ascendingController = TextEditingController();
   final TextEditingController descendingController = TextEditingController();
  RxList duplicateList = [].obs;

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
