import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rich_text_controller/rich_text_controller.dart';

class BoldStringController extends SuperController {

  final  firstController = RichTextController(
      onMatch: (List<String> abc) {print(abc.join(" "));}, patternMatchMap:
      {
        RegExp(r"(\*[^*]+\*)"): TextStyle(fontWeight: FontWeight.bold),
        RegExp(r"(\_[^_]+\_)"): TextStyle(fontStyle: FontStyle.italic),
        RegExp(r"(\*\_.*\_\*)"): TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)
      });

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
