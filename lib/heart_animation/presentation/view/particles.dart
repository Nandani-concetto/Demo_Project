import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'logger.dart';
import 'particle_model.dart';
import 'particle_painter.dart';

class ParticleWidget extends StatefulWidget {
  // final int numberOfParticles;
  final List<ParticleModel> numberOfParticles;
  final Rect boundary;
  final Duration totalDuration;

  ParticleWidget(this.numberOfParticles, this.boundary, this.totalDuration,
      {Key? key})
      : super(key: key) {
    Logger.write("Boundary is $boundary");
  }

  @override
  _ParticleWidgetState createState() => _ParticleWidgetState();
}

class _ParticleWidgetState extends State<ParticleWidget> {
  final Random random = Random();

  late List<ParticleModel> particles;
  var control = CustomAnimationControl.play;

  _ParticleWidgetState(); // state variable
  @override
  void initState() {
    particles = widget.numberOfParticles;
    // for (int i = 0; i < widget.numberOfParticles; i++) {
    //   particles.add(ParticleModel(random, i, widget.boundary));
    // }
    // widget.numberOfParticles.clamp(() => particles.add(ParticleModel(random)));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAnimation<double>(
      control: control,
      duration: widget.totalDuration,
      curve: Curves.linear,
      tween: Tween(begin: 0, end: 1),
      animationStatusListener: (AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          Logger.write('Animation completed!');
          particles.clear();
        }
      },
      builder: (context, child, value) {
        // Logger.write("@52 value is $value");
        _simulateParticles();
        // if (getParticlesLength() == 0) {
        //   return Container(
        //     child: Text("Completed"),
        //   );
        // }
        return CustomPaint(
          painter: ParticlePainter(particles, value),
        );
      },
    );
  }

  _simulateParticles() {
    particles.removeWhere((element) => element.isCompleted);
    for (var particle in particles) {
      particle.checkIfParticleNeedsToBeRestarted();
    }
  }

  int getParticlesLength() {
    // Logger.write("length is ${particles.length}");
    return particles.length;
  }
}
