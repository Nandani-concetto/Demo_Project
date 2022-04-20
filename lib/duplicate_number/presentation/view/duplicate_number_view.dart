import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/duplicate.dart';
import '../controllers/duplicate_number_controller.dart';

class DuplicateNumberPage extends GetView<DuplicateNumberController> {
  Map<String, int> myMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Duplicate Number"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [_getFirstTextField()],
              ),
            ),
            _getButton(),
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
          keyboardType: TextInputType.number,
          controller: controller.firstController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: "Enter First Value"),
        ),
      ),
    );
  }

  Widget _getButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        width: 100,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.grey[700]),
          onPressed: () {
            duplicateNumber();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  duplicateNumber() {
    var s = controller.firstController.text.toLowerCase().split(',');
    print(s);
    var list1 = s.toSet();
    myMap = Map<String, int>.fromIterables(
        list1, List.generate(list1.length, (i) => 0));
    print(myMap);
    for (int j = 0; j < s.length; j++) {
      var e = s[j];
      myMap[e] = myMap[e]! + 1;
      print(myMap[e]);
    }
    controller.output.clear();
    myMap.forEach((key, value) {
      if (value >= 1 && key != " ") {
        List<Object> map1 = [key, value];
        controller.output.add(map1);
        print("Index of ${map1.indexOf(map1)}");
      }
    });
  }

  Widget _getPrintNewList() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Text("Duplicate value is :  " + controller.output.join()),
        ));
  }
}
