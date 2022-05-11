import 'package:demo_project/common/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String initialRoute = RouteName.root;
  initialRoute = RouteName.listOfPage;
  runApp(DemoProject(initialRoute));
}

class DemoProject extends StatefulWidget {
  final String initialRoute;
  DemoProject(this.initialRoute);

  @override
  State<DemoProject> createState() => _DemoProjectState();
}

class _DemoProjectState extends State<DemoProject> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: widget.initialRoute,
      getPages: Routes.routes,
    );
  }
}

