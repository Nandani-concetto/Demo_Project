import 'dart:math';
import 'package:demo_project/heart_animation/presentation/controllers/heart_animation_controller.dart';
import 'package:flutter/material.dart';
import 'logger.dart';
import 'particle_model.dart';
import 'particles.dart';

// ignore: must_be_immutable
class HeartAnimationContainerWidget extends StatelessWidget {
  final HeartAnimationController? _liveStreamBloc;

  ///Total duration till the animation will continue run
  final Duration totalDuration;

  HeartAnimationContainerWidget(
    this._liveStreamBloc,
    this.totalDuration, {
    Key? key,
  }) : super(key: key);

//   @override
//   _HeartAnimationContainerWidgetState createState() =>
//       _HeartAnimationContainerWidgetState();
// }

// class _HeartAnimationContainerWidgetState
//     extends State<HeartAnimationContainerWidget> {
  // AppThemeState get _appTheme => widget._appTheme;
  int lastCompleted = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 178,
      bottom: MediaQuery.of(context).viewInsets.bottom + 193,
      // width: 177.41.w,
      child: IgnorePointer(
        ignoring: true,
        child: SizedBox(
          // color: Colors.teal,
          width: 178,
          height: 422,
          child: particleBuild(),
        ),
      ),
    );
  }

  IgnorePointer particleBuild() {
    return IgnorePointer(
      ignoring: true,
      child: StreamBuilder<List<ParticleModel>>(
          stream: _liveStreamBloc?.particleStream.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              Logger.write("we received @48 is ${snapshot.data}");
              return Stack(
                children: [
                  ParticleWidget(
                      snapshot.data!,
                      Rect.fromLTRB(
                        0,
                        0,
                        0,
                        MediaQuery.of(context).viewInsets.bottom + 422,
                      ),
                      totalDuration),
                ],
              );
            } else {
              return const Offstage();
            }
          }),
    );
  }

  Random random = Random();
  //double randValue = 0.0;
  Map<int, double> randomMap = {};
  double calculateValue = 0.0;
}
