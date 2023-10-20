import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class VoiceTestView extends StatefulWidget {
  VoiceTestView({super.key});

  @override
  State<VoiceTestView> createState() => _VoiceTestViewState();
}

class _VoiceTestViewState extends State<VoiceTestView> {
  final player = AudioPlayer();

  Future<void> playVoice() async {
    await player.play(UrlSource(
        'https://server16.mp3quran.net/hitham/Rewayat-Hafs-A-n-Assem/006.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: OutlinedButton(
                onPressed: () {
                  playVoice();
                  player.stop();
                  setState(() {});
                },
                child: Icon(player.state == PlayerState.playing
                    ? Icons.pause
                    : Icons.play_arrow)),
          )
        ],
      )),
    );
  }
}
