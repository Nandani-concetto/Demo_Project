import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

import '../view/create_stream_response.dart';
import '../view/detail_provider.dart';
import '../view/logger.dart';
import '../view/particle_model.dart';

class HeartAnimationController extends SuperController {
  final TextEditingController firstController = TextEditingController();
  RxList output = [].obs;
  int noOfHeart = 0;
  DetailProvider? detailProvider;
  List<ParticleModel> particleItems = [];
  int durationForHeart = 2000;
  Random random = Random();
  PublishSubject<List<ParticleModel>> particleStream = PublishSubject();
  CreateStreamResponse? liveStreamDetails;

  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }

  @override
  void onNewLikeCome() {
    Logger.write('onNewLikeCome');
    noOfHeart = noOfHeart + 1;
    addParticle(noOfHeart, Rect.fromLTRB(0, 0, 340, 350));
  }

  void addParticle(int index, Rect boundary) {
    detailProvider ??= DetailProvider(this);
    particleItems.add(
        ParticleModel(random, index, boundary, detailProvider: detailProvider));
    Logger.write(
        "adding $index heart and before remove ${particleItems.length}");
    Stream.value(particleItems)
        .debounceTime(Duration(milliseconds: durationForHeart))
        .transform(particleTransformer)
        .listen((event) {
      Logger.write("after remove ${event.length} and $event");
      particleStream.add(event);
    });
  }

  StreamTransformer<List<ParticleModel>, List<ParticleModel>>
      particleTransformer =
      StreamTransformer<List<ParticleModel>, List<ParticleModel>>.fromHandlers(
          handleData: (List<ParticleModel> data, EventSink sink) {
    data.removeWhere((element) => element.isCompleted);
    sink.add(data);
  });

  void markParticleCompleted(ParticleModel item) {
    int index = particleItems.indexOf(item);
    Logger.write("haystack is $particleItems and key is $item");
    if (index > -1) {
      Logger.write("mark completed $index with ${item.index}");
      particleItems[index] = item;
    } else {
      Logger.write("index not fond for mark complete for $item : $index");
    }
  }
}
