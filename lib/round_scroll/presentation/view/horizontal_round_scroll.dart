import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/round_scroll_controller.dart';
import 'dart:math' as math;

const double degrees2Radians = math.pi / 180.0;

class HorizontalRoundScrollPage extends GetView<RoundScrollController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horizontal Round Scroll"),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: SafeArea(
        child: Container(
          child: CircularScrollView(
            [
              _getCircle("1"),
              _getCircle("2"),
              _getCircle("3"),
              _getCircle("4"),
              _getCircle("5"),
              _getCircle("6"),
              _getCircle("7"),
              _getCircle("8"),
              _getCircle("9"),
              _getCircle("10"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCircle(String item) {
    return Center(
      child: GestureDetector(
        onTap: () {}, //insert function when icon is tapped
        child: Container(
          child: Center(
              child: Text(
                item,
                style: TextStyle(color: Colors.white),
              )),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
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
        this.radius = 100,
        this.itemMaxHeight = 0,
        this.itemMaxWidth = 0,
        this.padding = 0,
        this.reverse = false})
      : super(key: key);

  @override
  _CircularScrollViewState createState() => _CircularScrollViewState();
}

class _CircularScrollViewState extends State<CircularScrollView> {
  double? lastPosition;
  List<Widget> transformItems = [];
  double degreesRotated = 0;

  @override
  void initState() {
    _calculateTransformItems();
    super.initState();
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
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        // height: widget.radius*2+widget.itemMaxHeight,
        // width: widget.radius*2 + widget.itemMaxWidth,
        child: GestureDetector(
          onVerticalDragUpdate: (details) => setState(() {
            _calculateScroll(details);
          }),
          onVerticalDragEnd: (details) {
            lastPosition = null;
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
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
        ),
      ),
    );
  }
}

// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var x = size.width / 100 * 0.802;
//     var y = size.height / 100;
//     var path = Path()
//       ..moveTo(39.4 * x, 6.1 * y)
//       ..cubicTo(43.2 * x, -1.8 * y, 57.1 * x, -1.8 * y, 60.9 * x, 6.1 * y)
//       ..lineTo(99.1 * x, 84.1 * y)
//       ..cubicTo(102.1 * x, 90.2 * y, 99.1 * x, 93.9 * y, 92.0 * x, 95.6 * y)
//       ..cubicTo(67.4 * x, 101.7 * y, 36.9 * x, 101.7 * y, 9.2 * x, 95.6 * y)
//       ..cubicTo(1.2 * x, 93.8 * y, -1.3 * x, 88.7 * y, 1.2 * x, 84.1 * y)
//       ..lineTo(39.4 * x, 6.1 * y);
//
//     return path.shift(Offset(12, 0));
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => true;
// }
