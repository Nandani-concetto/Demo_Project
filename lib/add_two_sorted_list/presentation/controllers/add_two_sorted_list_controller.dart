import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTwoListController extends SuperController {
  List<TextEditingController> controllers = [];
  final TextEditingController firstListController = TextEditingController();
   //final TextEditingController secondListController = TextEditingController();
  RxList outputList = [].obs;
  RxList testList = [].obs;
  RxList finalList = [].obs;
  RxInt dropdownValue=1.obs;

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
