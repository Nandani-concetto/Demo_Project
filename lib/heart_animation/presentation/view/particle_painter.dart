import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import 'logger.dart';
import 'particle_model.dart';

class ParticlePainter extends CustomPainter {
  final List<ParticleModel> particles;
  final double value;

  ParticlePainter(this.particles, this.value);

  @override
  void paint(Canvas canvas, Size size) {
    // Paint paint = Paint();
    // paint
    //   ..color = Colors.white
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round
    //   ..strokeWidth = 1;

    Paint paint1 = Paint();
    paint1
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    double width = 30; //size.width;
    double height = 30; //size.height;

    for (var particle in particles) {
      if (!particle.isCompleted) {
        final progress = particle.progress();

        final MultiTweenValues<AniProps>? animation =
            particle.tween?.transform(progress);
        if (animation != null) {
          // Logger.write("with progress: $progress and we got animation value :" +
          //     animation.get<double>(AniProps.x).toString() +
          //     ":" +
          //     animation.get<double>(AniProps.y).toString());
          final position = Offset(
            animation.get<double>(AniProps.x), // * size.width,
            animation.get<double>(AniProps.y), // * size.height,
          );
          if (particle.index == 0) {
            Logger.write(
                "color value is: ${animation.get<Color>(AniProps.color)} with position $position at ${particle.index}");
          }
          paint1.color = animation.get<Color>(AniProps.color);
          // canvas.drawCircle(position, size.width * 0.2 * particle.size!, paint);
          Path path = Path();
          path.moveTo(0.5 * width, height * 0.35);
          path.cubicTo(0.2 * width, height * 0.1, -0.25 * width, height * 0.6,
              0.5 * width, height);
          path.moveTo(0.5 * width, height * 0.35);
          path.cubicTo(0.8 * width, height * 0.1, 1.25 * width, height * 0.6,
              0.5 * width, height);
          canvas.save();
          canvas.translate(position.dx, position.dy);
          canvas.drawPath(path, paint1);
          // canvas.drawPath(path, paint);
          canvas.restore();
        }
      } else {
        Logger.write("@58 completed");
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
