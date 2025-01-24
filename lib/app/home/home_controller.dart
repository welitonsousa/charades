import 'dart:async';

import 'package:charades/constants/audios.dart';
import 'package:charades/constants/words.dart';
import 'package:charades/repositories/words_repository.dart';
import 'package:charades/routers/pages.dart';
import 'package:charades/utils/audio_player.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final WordRepository wordRepository;
  HomeController({required this.wordRepository});

  static const INITIAL_TIMER_VALUE = 4;
  final showTimer = INITIAL_TIMER_VALUE.obs;

  bool get timerRunneing => showTimer.value != INITIAL_TIMER_VALUE;
  final loading = true.obs;

  @override
  void onInit() {
    getWords();
    super.onInit();
  }

  void startGame() {
    showTimer.value = 3;
    AppAudioPlayer.play(Audios.TIMER);
    Timer.periodic(Duration(seconds: 1), (t) async {
      if (showTimer.value == 1) {
        t.cancel();
        await Get.toNamed(Pages.GAME);
        showTimer.value = INITIAL_TIMER_VALUE;
        return;
      }
      showTimer.value -= 1;
    });
  }

  Future<void> getWords() async {
    try {
      loading.value = true;
      words = await wordRepository.getWords();
    } finally {
      loading.value = false;
    }
  }
}
