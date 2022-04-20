import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/routes.dart';
import '../controllers/add_two_sorted_list_controller.dart';

class DropDownView extends GetView<AddTwoListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Center(child: _getDropdownButton()),
      ),
    );
  }
  Widget _getDropdownButton() {

    return Obx(()=> DropdownButton<int>(
      value: controller.dropdownValue.value,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (int? newValue) {
        controller.dropdownValue.value = newValue!;
        Get.toNamed(RouteName.addTwoListPage);
        print(newValue);
      },
      items: <int>[1,2,3,4,5]
          .map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    ),
    );
  }
}