// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.316367
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_hive/twhiveC143.dart';


const preivC143 = "assets/";
TwAudioC143 audioMusic = TwAudioC143(
  audioKey: TwAudioC143.kAudioPlayerBg,
  audioPath: "${preivC143}yuyin/bg.mp3",
);

TwAudioC143 audioBtn_Dingdong1 = TwAudioC143(
  audioKey: TwAudioC143.kAudioPlayerScratch,
  audioPath: "${preivC143}yuyin/dingdong_1.mp3",
);
TwAudioC143 audioBtn_Water1 = TwAudioC143(
  audioKey: TwAudioC143.kAudioPlayerScratch,
  audioPath: "${preivC143}yuyin/water_1.mp3",
);

TwAudioC143 audioBtn_Water2 = TwAudioC143(
  audioKey: TwAudioC143.kAudioPlayerScratch,
  audioPath: "${preivC143}yuyin/water_2.mp3",
);
TwAudioC143 audioBtn_Fertilize2 = TwAudioC143(
  audioKey: TwAudioC143.kAudioPlayerScratch,
  audioPath: "${preivC143}yuyin/fertilize_2.mp3",
);
TwAudioC143 audioBtn_pop1 = TwAudioC143(
  audioKey: TwAudioC143.kAudioPlayerScratch,
  audioPath: "${preivC143}yuyin/pop1.mp3",
);
TwAudioC143 audioBtn_coin1 = TwAudioC143(
  audioKey: TwAudioC143.kAudioPlayerScratch,
  audioPath: "${preivC143}yuyin/coin1.mp3",
);
TwAudioC143 audioBtn_spin = TwAudioC143(
  audioKey: TwAudioC143.kAudioPlayerScratch,
  audioPath: "${preivC143}yuyin/spin.mp3",
);


class TwAudioC143 {
  String audioKey;
  String audioPath;

  TwAudioC143({required this.audioKey, required this.audioPath});

  static const String kAudioPlayerBg = "sdfgsdc143";
  static const String kAudioPlayerScratch = "ertwersdc143";

  bool _hasOn = true;

  bool get hasOn => TwHive.box.get(audioKey) ?? true;

  final audioPlayer = AssetsAudioPlayer();

  setReleaseMode() async {}

  Future<void> play({LoopMode loopMode = LoopMode.none}) async {
    twLooog("=====playLocalAssetBg==hasOn:$hasOn");
    if (hasOn) {
      await audioPlayer.open(
        Audio(audioPath),
        loopMode: loopMode,
        autoStart: true,
        playInBackground: PlayInBackground.disabledPause,
      );
      await audioPlayer.play();

      // await audioPlayer.play(AssetSource(audioPath), volume: 1);
    }
  }

  Future<void> stop() async {
    if (hasOn) {
      await audioPlayer.stop();
    }
  }

  void setSWHasOn(bool isOn, {required bool showAudioPlayOrPause}) {
    _hasOn = isOn;
    PlayerState state = audioPlayer.playerState.value;
    twLooog(
      "===GGAudioPlayer=audioKey:$audioKey=setHasOn=_hasOn=$_hasOn  state:$state",
    );
    TwHive.box.put(audioKey, isOn);
    if (showAudioPlayOrPause) {
      if (isOn) {
        if (state == PlayerState.stop || state == PlayerState.pause) {
          play();
        } else {
          audioPlayer.pause();
        }
      } else {
        audioPlayer.pause();
      }
    }
  }

  pause() {
    twLooog("=====audioplayer=pause=hasOn:$hasOn");
    if (hasOn) {
      audioPlayer.pause();
    }
  }

  resume() {
    twLooog("=====audioplayer=resume=");
    if (hasOn) {
      audioPlayer.play();
      // auto patch 794
    }
  }
}