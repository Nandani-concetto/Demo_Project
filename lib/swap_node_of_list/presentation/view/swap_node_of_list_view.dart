import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/swap_node_of_list_controller.dart';

class SwapNodePage extends GetView<SwapNodeController> {
  const SwapNodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swap Elements"),
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
          controller: controller.swapController,
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
            controller.swapController.text!=swapNode();
          },
          child: Center(
            child: Text("Click"),
          ),
        ),
      ),
    );
  }

  swapNode() {
    List<String> s = controller.swapController.text.toLowerCase().split('');
    print(s);
    for (int i = 0; i < s.length; i += 2) {
      s[i] =(int.parse(s[i]) + int.parse(s[i + 1])).toString();
      s[i + 1] = (int.parse(s[i]) - int.parse(s[i + 1])).toString();
      print("Second ${s[i + 1]}");
      s[i] = (int.parse(s[i]) - int.parse(s[i + 1])).toString();
      print("First ${s[i]}");
    }
    print(s);
  }
}
// final temp = s[i];
// s[i] = s[i+1];
// s[i+1] = temp;
// print(s[i]);
// print(s);
