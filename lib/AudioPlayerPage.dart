import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerPage extends StatefulWidget {
  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late AudioCache _audioCache;
  late AudioPlayer _audioPlayer;
  double _playbackRate = 1.0;

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(prefix: 'assets/audio/');
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playAudio() async {
    try {
      await _audioPlayer.play(AssetSource('audio/RPG_Battle_01.mp3'));
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  void _stopAudio() async {
    await _audioPlayer.stop();
  }

  void _fastForward() {
    setState(() {
      _playbackRate += 0.5;
      _playbackRate = _playbackRate.clamp(0.5, 2.0);
      _audioPlayer.setPlaybackRate(_playbackRate);
    });
  }

  void _slowDown() {
    setState(() {
      _playbackRate -= 0.5;
      _playbackRate = _playbackRate.clamp(0.5, 2.0);
      _audioPlayer.setPlaybackRate(_playbackRate);
    });
  }

  void _skipForward() async {
    Duration? currentPosition = await _audioPlayer.getCurrentPosition();
    if (currentPosition != null) {
      Duration newPosition = currentPosition + Duration(seconds: 10);
      await _audioPlayer.seek(newPosition);
    }
  }

  void _skipBackward() async {
    Duration? currentPosition = await _audioPlayer.getCurrentPosition();
    if (currentPosition != null) {
      Duration newPosition = currentPosition - Duration(seconds: 10);
      if (newPosition.inMilliseconds < 0) {
        newPosition = Duration.zero;
      }
      await _audioPlayer.seek(newPosition);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _playAudio,
              child: Text('Play Audio'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _stopAudio,
              child: Text('Stop Audio'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _slowDown,
                  child: Text('Slow Down'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _fastForward,
                  child: Text('Fast Forward'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _skipBackward,
                  child: Text('Skip Backward'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _skipForward,
                  child: Text('Skip Forward'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}