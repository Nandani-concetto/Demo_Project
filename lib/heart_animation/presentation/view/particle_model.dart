import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'detail_provider.dart';
import 'logger.dart';

enum AniProps { width, height, color, x, y }

class ParticleModel {
  MultiTween<AniProps>? tween;
  double? size;
  Duration duration = const Duration(seconds: 3);
  int startTime = 1;
  Random random;
  bool isCompleted = false;
  int index;
  Rect rectBoundary;
  double randValue = 0.0;
  DetailProvider? detailProvider;

  ParticleModel(this.random, this.index, this.rectBoundary,
      {this.detailProvider}) {
    restart();
  }

  restart() {
    Logger.write("restarting");
    final startPosition = Offset(rectBoundary.width / 2,
        rectBoundary.height - (rectBoundary.height * 0.11));
    final endPosition =
        Offset(detailProvider!.getRandom(rectBoundary, this), 0.00);
    // tween = TimelineTween<AniProps>()
    //   ..addScene(duration: duration).animate(AniProps.x,
    //       tween: Tween(begin: startPosition.dx, end: endPosition.dx),
    //       curve: Curves.easeIn)
    //   ..addScene(duration: duration).animate(AniProps.y,
    //       tween: Tween(begin: startPosition.dy, end: endPosition.dy),
    //       curve: Curves.easeIn);
    Logger.write(
        "start position is $startPosition and end position is: $endPosition");
    tween = MultiTween<AniProps>()
      ..add(AniProps.x, Tween(begin: startPosition.dx, end: endPosition.dx),
          duration)
      ..add(AniProps.y, Tween(begin: startPosition.dy, end: endPosition.dy),
          duration)
      ..add(
          AniProps.color,
          ColorTween(
              begin: const Color(0xFFFF0000)
                  .withOpacity(random.nextInt(10) % 2 == 0 ? 0.5 : 1),
              end: const Color(0xFFFF0000)),
          duration);

    duration = const Duration(seconds: 1);
    startTime = DateTime.now().millisecondsSinceEpoch;
    Logger.write("start time is $startTime $index");
    size = 0.2 + random.nextDouble() * 0.4;
  }

  checkIfParticleNeedsToBeRestarted() {
    // Logger.write("progress is ${progress()}");
    if (progress() == 1.0) {
      Logger.write("completed");
      isCompleted = true;
      detailProvider?.onAnimationComplete(this);
    }
  }

  double progress() {
    // Logger.write(
    //     "progress is ${DateTime.now().microsecondsSinceEpoch} and $startTime");
    return ((DateTime.now().millisecondsSinceEpoch - startTime) /
            duration.inMilliseconds)
        .clamp(0.0, 1.0)
        .toDouble();
  }

// getRandom(Rect rectBoundary) {
//   randValue = random.nextInt(9).toDouble();
//   // if (randValue < 0.5) {
//   return 0.92 - (randValue / 100);
//   // } else {
//   //   return (randValue * rectBoundry.height);
//   // }
// }
//1080 is 140 = 12%
//1080 is 40  = 3%
}
