import 'dart:async';
import 'dart:math';
import 'package:charades/constants/audios.dart';
import 'package:charades/constants/words.dart';
import 'package:charades/models/result_model.dart';
import 'package:charades/routers/pages.dart';
import 'package:charades/utils/audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GameController extends GetxController {
  static const MAX_TIMER_SECONDS = 90;
  final displayTimer = MAX_TIMER_SECONDS.obs;
  final currentWord = ''.obs;
  final backgroundColor = Colors.blue.obs;
  final results = <ResultModel>[];
  Timer? timer;
  @override
  void onReady() {
    sortWord();
    startTimer();
    devicePosition();
    super.onReady();
  }

  @override
  void onClose() {
    listen?.cancel();
    timer?.cancel();
    super.onClose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (displayTimer.value > 0) {
        displayTimer.value--;
        if (displayTimer.value == 3) {
          AppAudioPlayer.play(Audios.TIMER);
        }
      } else {
        t.cancel();
        if (!showWordResult) {
          results.add(ResultModel(
            word: currentWord.value,
            right: false,
          ));
        }
        Get.offAndToNamed(Pages.RESULTS, arguments: results);
      }
    });
  }

  void sortWord() {
    final randomIndex = Random().nextInt(words.length);
    currentWord.value = words[randomIndex];
  }

  Future<void> defineBackgroundColor(bool result) async {
    showWordResult = true;
    if (result) {
      backgroundColor.value = Colors.green;
      AppAudioPlayer.play(Audios.HAPPY);
    } else {
      backgroundColor.value = Colors.red;
      AppAudioPlayer.play(Audios.ERROR);
    }
    results.add(ResultModel(
      word: currentWord.value,
      right: result,
    ));
  }

  StreamSubscription<AccelerometerEvent>? listen;
  bool showWordResult = false;
  void devicePosition() {
    listen = accelerometerEventStream().listen(
      (AccelerometerEvent event) {
        final z = event.z.toInt();
        if (showWordResult && z >= -2 && z <= 2) {
          showWordResult = false;
          backgroundColor.value = Colors.blue;
          sortWord();
        }
        if (showWordResult) return;
        if (z == -8) {
          defineBackgroundColor(false);
        } else if (z == 8) {
          defineBackgroundColor(true);
        }
      },
      cancelOnError: true,
    );
  }
}
