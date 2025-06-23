import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Player {
  static Future<void> play(String src) async {
    final player = AudioPlayer();
    await player.play(AssetSource(src));
  }
}

void main() {
  runApp(const XylophoneLaguApp());
}

class XylophoneLaguApp extends StatelessWidget {
  const XylophoneLaguApp({super.key});

  Widget buildSongButton({
    required String title,
    required String fileName,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Player.play('songs/$fileName');
          },
          child: Text(title),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            'Prak. PBM - Xylophone',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildSongButton(
              title: "Baby Shark",
              fileName: "baby_shark.mp3",
              color: Colors.pinkAccent,
            ),
            buildSongButton(
              title: "Twinkle Twinkle",
              fileName: "twinkle.mp3",
              color: Colors.green,
            ),
            buildSongButton(
              title: "Happy Birthday",
              fileName: "hbd.mp3",
              color: Colors.blue,
            ),
            const SizedBox(height: 24),
            const Divider(thickness: 1),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Fitri Atika Salwa\n4522210080\nPrak. PBM - A',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
