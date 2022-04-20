import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/zigzag_conversion _controller.dart';

class ZigzagPage extends GetView<ZigzagController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Zigzag Conversion"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                child: Column(
              children: [_getTextField(), _getZigzagTextField()],
            )),
            _getButton(),
            _getPrintNewList()
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
          controller: controller.zigzagController,
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

  Widget _getZigzagTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          controller: controller.numberOfRowController,
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
            zigzag();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  zigzag() {
    controller.output.clear();
    var s = controller.zigzagController.text.toUpperCase().split('');
    int n = int.parse(controller.numberOfRowController.text);
    if (s == null || n == 0) {
      return;
    }
    if (n == 1) {
      controller.output.add(s.join());
      return;
    }
    for (int i = 0; i < s.length; i += (n - 1) * 2) {
      controller.output.add(s[i]);
    }
    for (int j = 1; j < n - 1; j++) {
      bool down = true;
      for (int i = j; i < s.length;) {
        controller.output.add(s[i]);
        if (down) {
          // going down
          i += (n - j - 1) * 2;
        } else {
          // going up
          i += (n - 1) * 2 - (n - j - 1) * 2;
        }

        down = !down;
      }
    }
    for (int i = n - 1; i < s.length; i += (n - 1) * 2) {
      controller.output.add(s[i]);
    }
    print(controller.output.join());
  }
  Widget _getPrintNewList() {
    return Obx(() => Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Text("New List :  " + controller.output.join()),
    ));
  }
}
