import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/duplicate.dart';
import '../controllers/median_of_List_controller.dart';

class MedianOfListPage extends GetView<MedianOfListController> {
  List<int> test=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Median Of The List"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  _getFirstTextField(),
                  _getSecondTextField(),
                ],
              ),
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
              hintText: "Hint:- 1,2,3..."),
        ),
      ),
    );
  }

  Widget _getSecondTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          controller: controller.secondController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: "Enter First Value",
              hintText: "Hint :- 1,2,3..."),
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
            median();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  median() {
    var s = controller.firstController.text.toLowerCase().split(',');
    var n = controller.secondController.text.toLowerCase().split(',');
    s.remove("");
    print(s);
    n.remove("");
    print(n);
    var result = s + n;
    result.remove("");
    print("Merged List:- $result");
    test=result.map(int.parse).toList();
    test.sort();
    controller.sortedList.clear();
    controller.sortedList.add(test);
    print("Sorted List:- $test");
    if(test.isEmpty){
      print("Please Enter value");
      controller.errorList.add("Please Enter Value");
    }
    else if (test.length % 2 != 0) {
      var output = getNumber(test.length / 2, precision: 0);
      var r=test[(output.round())];
      print("Median is :- $r");
      controller.output.clear();
      controller.errorList.clear();
      controller.output.add(r);
    } else {
      print(test.length);
      var output1 = getNumber((test.length - 1) / 2, precision: 0);
      int a = (test[output1.round()]);
      print("a;- $a");
      var output = getNumber((test.length / 2), precision: 0);
      int b = (test[output.round()]);
      print("b;- $b");
      var n=(a+b)/ 2;
      print(n);
      controller.errorList.clear();
      controller.output.clear();
      controller.output.add(n);
    }
  }

  double getNumber(double input, {int precision = 2}) => double.parse(
      '$input'.substring(0, '$input'.indexOf('.') + precision + 1));

  Widget _getPrintNewList() {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            children: [
              Text(controller.errorList.join()),
              Text("SortedList Is :  " + controller.sortedList.join()),
              Text("Median Is :  " + controller.output.join()),
            ],
          ),
        ));
  }
}
