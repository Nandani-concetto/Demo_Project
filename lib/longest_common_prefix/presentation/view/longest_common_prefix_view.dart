import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/duplicate.dart';
import '../controllers/longest_common_prefix_controller.dart';

class LongestCommonPrefixPage extends GetView<LongestCommonPrefixController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Longest Common Prefix"),
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
          controller: controller.longestCommonPrefixController,
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
            longestCommonPrefix();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  longestCommonPrefix() {
    controller.output.clear();
    var s = controller.longestCommonPrefixController.text.split(',');
    print(s);
    if (s == null || s.length == 0) {
      return "";
    }
    if (s.length == 1) {
      controller.output.add(s[0]);
      return s[0];
    }
    String prefix = s[0];
    for (int i = 1; i < s.length; i++) {
      while (s[i].indexOf(prefix) != 0) {
        prefix = prefix.substring(0, prefix.length - 1);
        if (prefix.isEmpty) return "";
      }
    }
    print(prefix);
    controller.output.add(prefix);
  }
  Widget _getPrintNewList() {
    return Obx(() => Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Text("New List :  " + controller.output.join()),
    ));
  }
}
