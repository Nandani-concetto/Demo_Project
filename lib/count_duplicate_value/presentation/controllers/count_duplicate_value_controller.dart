import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/duplicate.dart';

class DuplicateController extends SuperController {
  final TextEditingController duplicateController = TextEditingController();
  RxList duplicateList = [].obs;  @override
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
