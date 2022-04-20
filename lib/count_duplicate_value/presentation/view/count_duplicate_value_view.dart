import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/duplicate.dart';
import '../controllers/count_duplicate_value_controller.dart';

class DuplicatePage extends GetView<DuplicateController> {
  DuplicatePage({Key? key}) : super(key: key);
  Map<String, int> myMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Duplicate Value"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: _getTextField(),
            ),
            _getButton(),
            _getDummy(),
          ],
        ),
      ),
    );
  }

  Widget _getTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          controller: controller.duplicateController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: "Enter String"),
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
            duplicate();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  duplicate() {
    var input = controller.duplicateController.text.toLowerCase().split('');
    var list1 = input.toSet();
    myMap = Map<String, int>.fromIterables(
        list1, List.generate(list1.length, (i) => 0));
    input.forEach((e) => myMap[e] = myMap[e]! + 1);
    controller.duplicateList.clear();
    myMap.forEach((key, value) {
      if (value > 1 && key != " ")
        controller.duplicateList.add(DuplicateValue(key, value));
    });
  }

  Widget _getDummy() {
    return Obx(
      () =>Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: controller.duplicateList.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(controller.duplicateController.text +
                  " Contains" +
                  "  " +
                  controller.duplicateList[index].name +
                  "  " +
                  controller.duplicateList[index].count.toString() +
                  " Times");
            }),
      ),
    );
  }
}
