import 'package:flutter/material.dart';
import 'package:flutter_master/AudioPlayerPage.dart';
import 'package:flutter_master/AudioRecorderPage.dart';
import 'package:flutter_master/video.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _navigateToAudioRecorderPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AudioRecorderPage()),
    );
  }

  void _navigateToAudioPlayerPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AudioPlayerPage()),
    );
  }

    void _navigateToVideoPlayerPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VideoApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _navigateToAudioRecorderPage,
              child: Text('Go to Audio Recorder Page'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _navigateToAudioPlayerPage,
              child: Text('Go to Audio Player Page'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _navigateToVideoPlayerPage,
              child: Text('Go to Video Player Page'),
            ),
          ],
        ),
      ),
    );
  }
}