import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/checked_controller.dart';

class CheckBoxPage extends GetView<CheckedController> {
  const CheckBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Checkbox"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return _getCheckBox(index);
              })
        ],
      ),
    );
  }

  Widget _getCheckBox(int index) {
    return Row(
      children: [
        Obx(
          () => IconButton(
            icon: Icon(controller.isChecked.value == index
                ? Icons.check_box
                : Icons.check_box_outline_blank_outlined),
            onPressed: () {
              controller.isChecked.value = index;
            },
          ),
        ),
        Text("Checkbox")
      ],
    );
  }
}
