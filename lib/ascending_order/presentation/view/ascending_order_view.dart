import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ascending_order_controller.dart';

class AscendingOrderPage extends GetView<AscendingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ascending Order"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  _getTextFieldForAscending(),
                ],
              ),
            ),
            _getButton(),
            _getAscendingOrder()
          ],
        ),
      ),
    );
  }

  Widget _getTextFieldForAscending() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          controller: controller.ascendingController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: "Enter Number"),
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
            controller.ascendingController.text = ascending();
            controller.descendingController.text = descending();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  String ascending() {
    var input = controller.ascendingController.text.toLowerCase().split('');
    var list1 = input.toList();
    print(list1);
    String temp = "";
    for (var i = 0; i < list1.length; i++) {
      for (var j = 0; j < (list1.length - 1); j++) {
        if (int.parse(list1[j]) > int.parse(list1[j + 1])) {
          temp = list1[j];
          list1[j] = list1[j + 1];
          list1[j + 1] = temp;
        }
      }
    }
    controller.duplicateList.clear();
    controller.duplicateList.add(list1);
    print("Updated List $list1");
    return list1.join();
  }

  String descending() {
    var input = controller.ascendingController.text.toLowerCase().split('');
    var list1 = input.toList();
    print(list1);
    String temp = "";
    for (var i = 0; i < list1.length; i++) {
      for (var j = 0; j < (list1.length - 1); j++) {
        if (int.parse(list1[j]) < int.parse(list1[j + 1])) {
          temp = list1[j];
          list1[j] = list1[j + 1];
          list1[j + 1] = temp;
        }
      }
    }
    controller.duplicateList.clear();
    controller.duplicateList.add(list1);
    print("Updated List $list1");
    return list1.join();
  }

  Widget _getAscendingOrder() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: controller.duplicateList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Text("Ascending Order:- " +
                      controller.ascendingController.text),
                  Text("Descending Order:- " +
                      controller.descendingController.text),
                ],
              );
            }),
      ),
    );
  }
}
