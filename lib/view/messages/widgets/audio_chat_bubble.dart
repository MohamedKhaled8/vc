import 'package:audioplayers/audioplayers.dart';
import 'package:chat_bubbles/bubbles/bubble_normal_audio.dart';
import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart' as JAP;
import 'package:vc/theme/constant/const_colors.dart';

class AudioChatBuble extends StatefulWidget {
  final String audio;
  final Duration duration;
  final bool sender;
  // final DateTime dateTime;

  AudioChatBuble({
    required this.audio,
    required this.duration,
    required this.sender,
    // required this.dateTime,
  });

  @override
  State<AudioChatBuble> createState() => _AudioChatBubleState();
}

class _AudioChatBubleState extends State<AudioChatBuble> {
  final player = AudioPlayer();

  Duration? position;
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: BubbleNormalAudio(
        color: ColorApp.primary,
        duration: widget.duration.inSeconds.toDouble(),
        position: position?.inSeconds.toDouble(),
        isPlaying: isPlaying,
        isLoading: isLoading,
        isPause: isPause,
        onSeekChanged: (value) async {
          position = Duration(seconds: value.toInt());
          await player.seek(Duration(seconds: value.toInt()));
          setState(() {});
        }, //_changeSeek
        onPlayPauseButtonClick: () async {
          if (isPlaying == false) {
            isPlaying = true;
            isPause = false;
            if (await player.state == PlayerState.playing) {
              // kSnackBarError(context: context);
            }
            await player.play(DeviceFileSource(widget.audio));
            player.onPositionChanged.listen((event) {
              position = event;
              setState(() {});
            });

            player.onPlayerComplete.listen((event) {
              position = const Duration(seconds: 0);
              isPlaying = false;
              isPause = false;
              setState(() {});
            });
          } else {
            isPause = true;
            isPlaying = false;
            await player.pause();
          } // will immediately start playing
          setState(() {});
        },
        isSender: widget.sender, //PlayAudio
      ),
    );
  }
}
