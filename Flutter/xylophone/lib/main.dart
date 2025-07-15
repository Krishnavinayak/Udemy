import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: XylophoneApp()
    ));
}

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  late final AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
  void playSound(int soundNum) async {
                  await player.setAsset('assets/note$soundNum.wav');
                  await player.play();
                }
  Expanded buildFunc(Color color, int soundNum)
  {
    return Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                
                backgroundColor: color,
                shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, 
                ),
              ),
              onPressed: () {
                playSound(soundNum);
              },
              child: Text(""),
            ),
          );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildFunc(Colors.red, 1),
          buildFunc(Colors.deepOrange, 2),
          buildFunc(Colors.orange, 3),
          buildFunc(Colors.orangeAccent, 4),
          buildFunc(Colors.yellow, 5),
          buildFunc(Colors.greenAccent, 6),
          buildFunc(Colors.green, 7),
        ],
      ),
    );
  }
}
