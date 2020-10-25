import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  List<Color> colorSelector = [
    Color(0xff001F29),
    Color(0xff003D52),
    Color(0xff006D8F),
    Color(0xff00ACE0),
    Color(0xff33CFFF),
    Color(0xff85E2FF),
    Color(0xffD6F5FF),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            ColoredTile(
              colorUsed: colorSelector[0],
              sound: 1,
            ),
            ColoredTile(
              colorUsed: colorSelector[1],
              sound: 2,
            ),
            ColoredTile(
              colorUsed: colorSelector[2],
              sound: 3,
            ),
            ColoredTile(
              colorUsed: colorSelector[3],
              sound: 4,
            ),
            ColoredTile(
              colorUsed: colorSelector[4],
              sound: 5,
            ),
            ColoredTile(
              colorUsed: colorSelector[5],
              sound: 6,
            ),
            ColoredTile(
              colorUsed: colorSelector[6],
              sound: 7,
            )
          ],
        ),
      ),
    );
  }
}

class ColoredTile extends StatelessWidget {
  Color colorUsed = Colors.red;
  int sound = 1;

  ColoredTile({@required this.colorUsed, @required this.sound});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          AudioCache player = AudioCache();
          player.play("note$sound.wav");
          print("clicked");
        },
        child: Container(
          color: colorUsed,
        ),
      ),
    );
  }
}
