import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerW extends StatefulWidget {
  final String audio;
  AudioPlayerW(this.audio);

  @override
  _AudioPlayerWState createState() => _AudioPlayerWState();
}

class _AudioPlayerWState extends State<AudioPlayerW> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.05), borderRadius: BorderRadius.circular(50)),
        child: Row(
          children: [
            Container(
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(0, 0, 0, 0.05),
                child: IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 20,
                  color: Colors.black,
                  onPressed: () async {
                    if (isPlaying) {
                      await audioPlayer.pause();
                    } else {
                      String url = 'http://localhost:8080/files/get/${widget.audio}';
                      await audioPlayer.play(UrlSource(url));
                    }
                  },
                ),
              )
            ),
            Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {},
            ),
            Text(formatTime(duration - position))
          ],
        ),
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,seconds,
    ].join(':');
  }
}