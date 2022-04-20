import 'package:demo_project/test/presentation/controllers/test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropPage extends GetView<TestController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                child: Column(
                  children: [

                  ],
                )),
            _getButton(),
          ],
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
            controller.outputList.value =
                int.parse(controller.numberController.text);
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }
}