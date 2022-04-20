import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/reverse_string_controller.dart';

class ReverseStringPage extends GetView<ReverseController> {
  const ReverseStringPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reverse Value"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: Column(
        children: [
          Form(child: _getTextField()),
          _getButton(),
        ],
      ),
    );
  }

  Widget _getTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          controller: controller.dummyController,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.blue)),
              labelText: "Enter Value"),
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
            controller.dummyController.text = reversed(controller.dummyController.text);
            controller.reversController.text = controller.dummyController.text;
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  String reversed(String s) {
    String temp = "";
    for (int i = s.length - 1; i >= 0; i--) {
      temp += s[i];
    }
    return temp;
  }

}
