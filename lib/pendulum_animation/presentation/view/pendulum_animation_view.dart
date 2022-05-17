import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pendulum_animation_controller.dart';

class PendulumAnimationPage extends GetView<PendulumAnimationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pendulum Animation"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: Container(child: HomeScreen()),
    );
  }

// Widget _getPendulum() {
//   return Column(
//     children: [
//       SizedBox(height: 60),
//       Center(
//         child: Container(
//           width: 250,
//           height: 20,
//           color: Colors.blueGrey,
//         ),
//       ),
//       Stack(
//         alignment: Alignment.center,
//         children: [
//           Container(
//             width: 20,
//             height: 250,
//             color: Colors.blueGrey,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 200),
//             child: Container(
//               height: 50,
//               width: 50,
//               decoration: BoxDecoration(
//                   shape: BoxShape.circle, color: Colors.blueGrey),
//             ),
//           ),
//         ],
//       ),
//     ],
//   );
// }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  double? test;
  late AnimationController animationController;

  HomeScreenState();

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animationController.addListener(() {
      if (animationController.isCompleted) {
        //animationController.forward();
        animationController.reverse();
        animationController.repeat();
        print("Nandu");
      }
      if (animationController.isDismissed) {
        animationController.forward();
      }
      setState(() {});
    });
    animationController.forward();
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 0.3), weight: 0.1),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: -0.3), weight: 0.1),
      // TweenSequenceItem<double>(
      //     tween: Tween<double>(begin: -0.3, end: 0.0), weight: 0.1)
    ]).animate(animation!);

    //Tween(begin: -0.3, end: 0.3).animate(animation!);
  }

  @override
  Widget build(BuildContext context) {
    print("Test:- $animation");
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                width: 250,
                height: 20,
                color: Colors.blueGrey,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Transform(
                    alignment: FractionalOffset(0.5, 0.1),
                    transform: Matrix4.rotationZ(animation!.value),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 20,
                          height: 250,
                          color: Colors.blueGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 200),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blueGrey),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Row(
              children: [
                Container(
                  width: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black54),
                    onPressed: () {
                      animationController.reset();
                      // test = animation!.value;
                      // print("Last value : $test");
                      // setState(() {
                      //   animation = CurvedAnimation(
                      //       parent: animationController,
                      //       curve: Curves.easeInOut);
                      //   animation =
                      //       Tween(begin: test, end: 0.0).animate(animation!);
                      // });
                      animationController.stop();
                    },
                    child: Text("Stop"),
                  ),
                ),
                Spacer(),
                Container(
                  width: 120,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black54),
                    onPressed: () {
                      animationController.forward();
                    },
                    child: Text("ReStart"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
