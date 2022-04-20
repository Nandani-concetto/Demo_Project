import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/duplicate.dart';
import '../controllers/index_of_first_occurrence_controller.dart';

class IndexOfFirstOccurrencePage
    extends GetView<IndexOfFirstOccurrenceController> {
  const IndexOfFirstOccurrencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Index of First Occurrence"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [_getFirstTextField(), _getSecondTextField()],
              ),
            ),
            _getButton(context),
            _getIndexOfOccurrenceList()
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
              labelText: "Enter First String"),
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
              labelText: "Enter needle String"),
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
            indexOfFirstOccurrence();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  indexOfFirstOccurrence() {
    var s1 = controller.firstController.text;
    var s2 = controller.secondController.text;
    print(s1);
    print(s2);
    controller.output.clear();
    s1.replaceAll(' ', '');
    s2.replaceAll(' ', '');
    if (s1 == "" && s2 == "" || s1==""||s2=="") {
      print("Please Enter Both Strings");
    } else if (s1.contains(s2)) {
      print(s1.indexOf(s2[0]));
      var result=s1.indexOf(s2[0]);
      controller.output.add(result);
    } else {
      print("-1");
      controller.output.add("-1");
    }
  }
  Widget _getIndexOfOccurrenceList() {
    return Obx(() => Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(
        children: [
          Text("Index is :-  ${controller.output.join()}"),
        ],
      ),
    ));
  }
}
