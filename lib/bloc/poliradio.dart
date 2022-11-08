import 'package:just_audio/just_audio.dart';

class PoliRadio {
  AudioPlayer player = AudioPlayer(); // Create a player
  late Duration? duration;

  void play() async {
    duration = await player.setUrl('https://streaming.poliradio.it/hq');
    await player.play();
  }

  void pause() async {
    await player.stop();
  }

  bool isPlaying() {
    return player.playing;
  }

  void playOrPause() {
    if (isPlaying()) {
      pause();
    } else {
      play;
    }
  }
}
