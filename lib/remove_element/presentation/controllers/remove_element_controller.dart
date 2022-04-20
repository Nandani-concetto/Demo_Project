import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemoveElementController extends SuperController {
  final TextEditingController numController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  RxList output = [].obs;
  RxList newList = [].obs;
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

