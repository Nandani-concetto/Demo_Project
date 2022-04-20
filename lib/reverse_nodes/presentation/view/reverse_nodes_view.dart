import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/reverse_nodes_controller.dart';

class ReverseNodePage extends GetView<ReverseNodeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reverse Nth Node"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                child: Column(
                  children: [
                    _getTextField(),
                    _getNodeTextField(),
                  ],
                )),
            _getButton(context),
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
          //keyboardType: TextInputType.number,
          controller: controller.headController,
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

  Widget _getNodeTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp("^[2-9]*"))
          ],
          controller: controller.nodeController,
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
            Reverse();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  Reverse() {
    var s = controller.headController.text.toLowerCase().split(',');
    int n = int.parse(controller.nodeController.text);
    print(s);
    print(n);
    for (var i = 0; i<=s.length; ) {
      final temp = s[i];
      s[i] = s[i + (n - 1)];
      s[i + (n - 1)] = temp;
      i += n;
      if(s.length-i>=n){
        continue;
      }
      else{
        break;
      }
    }
    controller.output.clear();
    controller.output.add(s);
    print(s);
  }

  Widget _getPrintNewList() {
    return Obx(() => Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Text("New List :- ${controller.output.join()} "),
    ));
  }
}
