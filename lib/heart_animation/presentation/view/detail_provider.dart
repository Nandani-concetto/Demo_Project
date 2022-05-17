import 'dart:math';
import 'dart:ui';
import '../controllers/heart_animation_controller.dart';
import 'particle_model.dart';

class DetailProvider {
  int lastCompleted = 0;
  Random random = Random();
  double randValue = 0.0;
  Map<int, double> randomMap = {};
  double calculateValue = 0.0;
  final HeartAnimationController _liveStreamBloc;

  DetailProvider(this._liveStreamBloc);

  double getRandom(Rect rectBoundary, ParticleModel item) {
    if (randomMap.containsKey(item.index)) {
      // ClLogger.d("re-used for ${item.index}");
      return randomMap[item.index]!;
    }
    double randValue = random.nextDouble();
    if (randValue < 0.5) {
      calculateValue = (-1) * (randValue * (rectBoundary.width / 2));
    } else {
      calculateValue = (randValue * (rectBoundary.width / 2));
    }
    randomMap[item.index] = calculateValue;
    // ClLogger.d("new value for ${item.index}");
    return calculateValue;
  }

  void onAnimationComplete(ParticleModel item) {
    if (lastCompleted < item.index) {
      lastCompleted = item.index;
    }
    item.isCompleted = true;
    _liveStreamBloc.markParticleCompleted(item);
  }

}
