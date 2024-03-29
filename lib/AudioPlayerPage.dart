import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerPage extends StatefulWidget {
  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  late AudioCache _audioCache;
  late AudioPlayer _audioPlayer;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _playAudio,
          child: Text('Play Audio'),
        ),
      ),
    );
  }
}