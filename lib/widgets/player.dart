import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:poliradio_app/bloc/PoliRadio.dart';
import 'package:poliradio_app/managers/poliradio_app_icons_icons.dart';

class PlayerWidget extends StatefulWidget {
  const PlayerWidget({super.key});

  @override
  State<PlayerWidget> createState() => _PlayerWidgetState();
}

const backgroundColor = Color(0xFF333333);

class _PlayerWidgetState extends State<PlayerWidget> {
  double _currentSliderValue = 0.75;
  final AudioPlayer _player = AudioPlayer(); // Create a player
  late Duration? duration;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  Future<void> _init() async {
    duration = await _player.setUrl('https://streaming.poliradio.it/hq');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: Icon(
              size: 25,
              _player.playing
                  ? PoliradioAppIcons.pause
                  : PoliradioAppIcons.play,
              color: Colors.white,
            ),
            onTap: () async {
              // Handle play / pause _player
              if (!_player.playing) {
                await _player.play();
              } else {
                await _player.pause();
              }

              // Set current state to update view
              setState(() {});
            },
          ),
        ),
        Row(
          children: [
            const Icon(
              PoliradioAppIcons.speaker,
              size: 25,
              color: Colors.white,
            ),
            Expanded(
              child: Slider(
                  value: _currentSliderValue,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;

                      // Handle volume _player
                      _player.setVolume(value);
                    });
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
