import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import '../controllers/pendulum_animation_controller.dart';

class PendulumPage extends GetView<PendulumAnimationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pendulum Animation'),
          centerTitle: true,
          backgroundColor: Colors.grey[700],
        ),
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Container(
                width: 250,
                height: 20,
                color: Colors.blueGrey,
              ),
            ),
            CircularScrollView(
               [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Center(
                      child: Container(
                        height: 250,
                        width: 20,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top:200),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

          ],
        ));
  }
}

class CircularScrollView extends StatefulWidget {
  final List<Widget> items;
  final double radius;
  final double itemMaxHeight;
  final double itemMaxWidth;
  final double padding;
  final bool reverse;

  CircularScrollView(this.items,
      {Key? key,
        this.radius =20,
        this.itemMaxHeight = 0,
        this.itemMaxWidth = 0,
        this.padding = 0,
        this.reverse = false})
      : super(key: key);

  @override
  _DraggableCardState createState() => _DraggableCardState();
}
class _DraggableCardState extends State<CircularScrollView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double? lastPosition;
  List<Widget> transformItems = [];
  double degreesRotated = 0;

  // void _runAnimation(Offset pixelsPerSecond, Size size) {
  //   _animation = _controller.drive(
  //     AlignmentTween(
  //       begin: _dragAlignment,
  //       end: Alignment.center,
  //     ),
  //   );
  //   final unitsPerSecondX = pixelsPerSecond.dx / size.width;
  //   final unitsPerSecondY = pixelsPerSecond.dy / size.height;
  //   final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
  //   final unitVelocity = unitsPerSecond.distance;
  //
  //   const spring = SpringDescription(
  //     mass: 30,
  //     stiffness: 1,
  //     damping: 1,
  //   );
  //
  //   final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
  //
  //   _controller.animateWith(simulation);
  // }

  @override
  void initState() {
    _calculateTransformItems();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void _calculateTransformItems() {
    transformItems = [];
    for (int i = 0; i < widget.items.length; i++) {
      double startAngle = (i / widget.items.length) * 2 * math.pi;
      double currentAngle = degreesRotated + startAngle;
      transformItems.add(
        Transform(
          transform: Matrix4.identity()
            ..translate(
              (widget.radius) * math.cos(currentAngle),
              (widget.radius) * math.sin(currentAngle),
            ),
          child: widget.items[i],
        ),
      );
    }
  }
  void _calculateScroll(DragUpdateDetails details) {
    if (lastPosition == null) {
      lastPosition = details.localPosition.dx;
      return;
    }
    double distance = details.localPosition.dx - lastPosition!;
    double distanceWithReversal = widget.reverse ? distance : -distance;
    lastPosition = details.localPosition.dx;
    degreesRotated += distanceWithReversal / (widget.radius);
    _calculateTransformItems();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onVerticalDragUpdate: (details) => setState(() {
        _calculateScroll(details);
      }),
      onVerticalDragEnd: (details) {
        lastPosition = null;
      },
      child: Container(
        // height: double.infinity,
        // width: double.infinity,
        color: Colors.transparent,
        child: ClipRect(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: widget.padding),
              child: Stack(
                children: transformItems,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class DraggableCard extends StatefulWidget {
//   final Widget child;
//
//   const DraggableCard({required this.child});
//
//   @override
//   _DraggableCardState createState() => _DraggableCardState();
// }
//
// class _DraggableCardState extends State<DraggableCard>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//
//   Alignment _dragAlignment = Alignment.center;
//
//   late Animation<Alignment> _animation;
//
//   void _runAnimation(Offset pixelsPerSecond, Size size) {
//     _animation = _controller.drive(
//       AlignmentTween(
//         begin: _dragAlignment,
//         end: Alignment.center,
//       ),
//     );
//     // evaluating velocity
//     final unitsPerSecondX = pixelsPerSecond.dx / size.width;
//     final unitsPerSecondY = pixelsPerSecond.dy / size.height;
//     final unitsPerSecond = Offset(unitsPerSecondY, unitsPerSecondX);
//     final unitVelocity = unitsPerSecond.distance;
//
//     const spring = SpringDescription(
//       mass: 30,
//       stiffness: 1,
//       damping: 1,
//     );
//
//     final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
//
//     _controller.animateWith(simulation);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//
//     _controller.addListener(() {
//       setState(() {
//         _dragAlignment = _animation.value;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onPanDown: (details) {
//         _controller.stop();
//       },
//       onPanUpdate: (details) {
//         setState(() {
//           _dragAlignment += Alignment(
//             details.delta.dx / (size.width / 2),
//             details.delta.dy / (size.height / 2),
//           );
//         });
//       },
//       onPanEnd: (details) {
//         _runAnimation(details.velocity.pixelsPerSecond, size);
//       },
//       child: Align(
//         alignment: _dragAlignment,
//         child: widget.child,
//       ),
//     );
//   }
// }

// class PendulumScroll extends StatefulWidget {
//   final Widget child;
//    const PendulumScroll({required this.child});
//
//   @override
//   _PendulumScrollState createState() => _PendulumScrollState();
// }
//
// class _PendulumScrollState extends State<PendulumScroll>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//
//   Alignment _dragAlignment = Alignment.center;
//
//   late Animation<Alignment> _animation;
//
//   void _runAnimation(Offset pixelsPerSecond, Size size) {
//     _animation = _controller.drive(
//       AlignmentTween(
//         begin: _dragAlignment,
//         end: Alignment.center,
//       ),
//     );
//     final unitsPerSecondX = pixelsPerSecond.dx / size.width;
//     final unitsPerSecondY = pixelsPerSecond.dy / size.height;
//     final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
//     final unitVelocity = unitsPerSecond.distance;
//
//     const spring = SpringDescription(
//       mass: 30,
//       stiffness: 1,
//       damping: 1,
//     );
//
//     final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
//
//     _controller.animateWith(simulation);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//
//     _controller.addListener(() {
//       setState(() {
//         _dragAlignment = _animation.value;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onPanDown: (details) {
//         _controller.stop();
//       },
//       onPanUpdate: (details) {
//         setState(() {
//           _dragAlignment += Alignment(
//             details.delta.dx / (size.width / 2),
//             details.delta.dy / (size.height / 2),
//           );
//         });
//       },
//       onPanEnd: (details) {
//         _runAnimation(details.velocity.pixelsPerSecond, size);
//       },
//       child: Align(
//         alignment: _dragAlignment,
//         child: Card(
//           child: widget.child,
//         ),
//       ),
//     );
//   }
// }
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({required this.child, Key? key}) : super(key: key);
//
//   final Widget child;
//
//   @override
//   State<StatefulWidget> createState() {
//     return HomeScreenState();
//   }
// }
//
// class HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   Alignment _dragAlignment = Alignment.center;
//   late Animation<Alignment> _animation;
//
//   void _runAnimation(Offset pixelsPerSecond, Size size) {
//     _animation = animationController.drive(
//       AlignmentTween(
//         begin: _dragAlignment,
//         end: Alignment.center,
//       ),
//     );
//     final unitsPerSecondX = pixelsPerSecond.dx / size.width;
//     final unitsPerSecondY = pixelsPerSecond.dy / size.height;
//     final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
//     final unitVelocity = unitsPerSecond.distance;
//
//     const spring = SpringDescription(
//       mass: 30,
//       stiffness: 1,
//       damping: 1,
//     );
//
//     final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
//
//     animationController.animateWith(simulation);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(vsync: this);
//
//     animationController.addListener(() {
//       setState(() {
//         _dragAlignment = _animation.value;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onPanDown: (details) {
//         animationController.stop();
//       },
//       onPanUpdate: (details) {
//         setState(() {
//           _dragAlignment += Alignment(
//             details.delta.dx / (size.width / 2),
//             details.delta.dy / (size.height / 2),
//           );
//         });
//       },
//       onPanEnd: (details) {
//         _runAnimation(details.velocity.pixelsPerSecond, size);
//       },
//       child: Align(
//         alignment: _dragAlignment,
//         child: widget.child,
//       ),
//     );
//   }
// }
