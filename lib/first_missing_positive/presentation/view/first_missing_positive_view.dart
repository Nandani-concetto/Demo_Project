import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/duplicate.dart';
import '../controllers/first_missing_positive_controller.dart';

class FirstMissingPositivePage extends GetView<FirstMissingPositiveController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Missing Positive"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: _getFirstTextField(),
            ),
            _getButton(context),
            _getPrintNewList()
          ],
        ),
      ),
    );
  }

  Widget _getFirstTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          controller: controller.firstController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: "Enter First Value",
            hintText: "Only Integer (1,2,3..)"
          ),
        ),
      ),
    );
  }

  Widget _getButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        width: 100,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.grey[700]),
          onPressed: () {
            FocusScope.of(context).requestFocus(new FocusNode());
            missingPositive();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  missingPositive() {
    List<String> s = controller.firstController.text.toLowerCase().split(',');
    s.remove("");
    Iterable<int> num=s.map(int.parse);
    print(num);
    var i=1;
    for (; i <= num.length; i++) {
      if (!num.contains(i)) {
        break;
      }
    }
    print(i);
    controller.output.clear();
    controller.output.add(i);
  }
  Widget _getPrintNewList() {
    return Obx(() => Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Text("First Missing Positive :-  " + controller.output.join()),
    ));
  }
}
