// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CheckBox extends StatefulWidget {
//   const CheckBox({Key? key}) : super(key: key);
//
//   @override
//   State<CheckBox> createState() => _CheckBoxState();
// }
//
// class _CheckBoxState extends State<CheckBox> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Select Checkbox"),
//         centerTitle: true,
//         backgroundColor: Colors.grey[700],
//       ),
//       body: Column(
//         children: [
//           ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               itemCount: 5,
//               itemBuilder: (BuildContext context, int index) {
//                 return _getCheckBox();
//               })
//         ],
//       ),
//     );
//   }
//
//   Widget _getCheckBox() {
//     return Row(
//       children: [
//         IconButton(
//             onPressed: () {},
//             icon: Icon(
//                 ? true
//                 ? Icons.check_box
//                 : Offstage()
//                 : false
//                 ? Icons.check_box_outline_blank_outlined)
//                 :
//         ),
//         Text("CheckBox")
//       ],
//     );
//   }
// }
//
//
// class SellerHomePageFilterController extends SuperController {
//   RxInt _isChecked = 0.obs;
//   @override
//   void onDetached() {
//     print('onDetached called');
//   }
//
//   @override
//   void onInactive() {
//     print('onInative called');
//   }
//
//   @override
//   void onPaused() {
//     print('onPaused called');
//   }
//
//   @override
//   void onResumed() {
//     print('onResumed called');
//   }
//
// }
