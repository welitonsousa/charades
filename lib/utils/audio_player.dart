import 'package:audioplayers/audioplayers.dart';

class AppAudioPlayer {
  static void play(String path) {
    final player = AudioPlayer();
    player.play(AssetSource(path));
  }
}
