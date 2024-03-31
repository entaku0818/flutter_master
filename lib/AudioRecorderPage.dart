import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class AudioRecorderPage extends StatefulWidget {
  @override
  _AudioRecorderPageState createState() => _AudioRecorderPageState();
}

class _AudioRecorderPageState extends State<AudioRecorderPage> {
  FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _recorder.openRecorder();
  }

  @override
  void dispose() {
    _recorder.closeRecorder();
    super.dispose();
  }

  Future<void> startRecording() async {
    await _recorder.startRecorder(toFile: 'audio.aac');
    setState(() {
      _isRecording = true;
    });
  }

  Future<void> stopRecording() async {
    await _recorder.stopRecorder();
    setState(() {
      _isRecording = false;
    });
  }

  Future<void> playRecording() async {
    FlutterSoundPlayer _player = FlutterSoundPlayer();
    await _player.openPlayer();
    await _player.startPlayer(fromURI: 'audio.aac');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Recorder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isRecording ? null : startRecording,
              child: Text('Start Recording'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isRecording ? stopRecording : null,
              child: Text('Stop Recording'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: playRecording,
              child: Text('Play Recording'),
            ),
          ],
        ),
      ),
    );
  }
}