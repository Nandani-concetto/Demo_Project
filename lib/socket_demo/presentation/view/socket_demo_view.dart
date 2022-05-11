import 'dart:core';
import 'package:demo_project/socket_demo/presentation/controllers/socket_demo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'chat.dart';

class SocketDemoPage extends GetView<SocketController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Socket"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: _getChat(context),
    );
  }

  Widget _getChat(BuildContext context) {
    Size size = MediaQuery.maybeOf(context)!.size;
    return Stack(
      children: [
        SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(vertical: 100),
            children: <Widget>[
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 150,
                        child: Container(
                          width: size.width * 0.80,
                          child: TextField(
                            controller: controller.nameController,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              labelStyle:
                                  TextStyle(fontSize: 15, color: Colors.black),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            style: TextStyle(fontSize: 20),
                            keyboardType: TextInputType.text,
                            maxLength: 25,
                          ),
                        ),
                        ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 30),
                        width: size.width * 0.80,
                        height: 40,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black38),
                          onPressed: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Chat(user: controller.nameController.text),
                              ),
                            );
                            //Get.toNamed(RouteName.chat,arguments:["",controller.nameController.text] );
                          },
                          child: Text('Go to Chat',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, this.title}) : super(key: key);
//   final String? title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.maybeOf(context)!.size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       resizeToAvoidBottomInset: true,
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             child: ListView(
//               shrinkWrap: true,
//               padding: EdgeInsets.symmetric(vertical: 100),
//               children: <Widget>[
//                 Column(
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           margin: EdgeInsets.symmetric(vertical: 5),
//                           height: 150,
//                           child: Container(
//                             width: size.width * 0.80,
//                             child: TextField(
//                               controller: _nameController,
//                               cursorColor: Colors.black,
//                               decoration: const InputDecoration(
//                                 labelText: 'Name',
//                                 labelStyle: TextStyle(
//                                     fontSize: 15, color: Colors.black),
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide:
//                                   BorderSide(color: Colors.black),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide:
//                                   BorderSide(color: Colors.black),
//                                 ),
//                                 disabledBorder: UnderlineInputBorder(
//                                   borderSide:
//                                   BorderSide(color: Colors.grey),
//                                 ),
//                               ),
//                               style: TextStyle(fontSize: 20),
//                               keyboardType: TextInputType.text,
//                               maxLength: 25,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.symmetric(vertical: 30),
//                           width: size.width * 0.80,
//                           height: 40,
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               primary: Colors.black38
//                             ),
//                             onPressed: _openChat,
//                             child: Text('Go to Chat',
//                                 style: TextStyle(
//                                     fontSize: 20, color: Colors.white)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//   void _openChat() {
//     Get.toNamed(RouteName.chat,arguments:["",_nameController.text] );
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(
//     //     builder: (context) => Chat(user: _nameController.text),
//     //   ),
//     // );
//   }
// }
