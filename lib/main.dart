import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

const myUrl = 'http://d21c.com/LooneyRon/sounds/6jungle.wav';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  // function to play notes with an input argument
  void playNote(int noteNumber) {
    final AudioCache player = AudioCache(prefix: 'assets/audios/');
    player.play('note$noteNumber.wav');
  }

  FlatButton buildKey(
      {Color keyColor, int playNoteNumber, String noteText, double keyWidth}) {
    return FlatButton(
      padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 170.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: Colors.blueGrey),
      ),
      color: colorGenerator(),
      onPressed: () {
        playNote(playNoteNumber);
      },
      // Container to hold a Text and custom BorderRadius
      child: Container(
        width: 40.0,
        height: 40.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
        ),
        child: Text('$noteText'),
      ),
    );
  }

  Color colorGenerator() {
    return Color(Random().nextInt(0xff334455));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text('Xylophone'),
        ),
        body: SafeArea(
          child: Center(
            child: FittedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlatButton(
                    color: Colors.green,
                    onPressed: () {
                      final AudioPlayer myPlayer = AudioPlayer();
                      myPlayer.play(myUrl);
                    },
                    child: Text(
                      'Audio Player',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  buildKey(
                    // keyColor: Colors.amber,
                    playNoteNumber: 1,
                    noteText: 'Do',
                  ),
                  buildKey(
                    // keyColor: Colors.green,
                    playNoteNumber: 2,
                    noteText: 'Re',
                  ),
                  buildKey(
                    // keyColor: Colors.pink,
                    playNoteNumber: 3,
                    noteText: 'Mi',
                  ),
                  buildKey(
                    // keyColor: Colors.deepPurple,
                    playNoteNumber: 4,
                    noteText: 'Fa',
                  ),
                  buildKey(
                    // keyColor: Colors.limeAccent,
                    playNoteNumber: 5,
                    noteText: 'So',
                  ),
                  buildKey(
                    // keyColor: Colors.brown,
                    playNoteNumber: 6,
                    noteText: 'La',
                  ),
                  buildKey(
                    // keyColor: Colors.blue,
                    playNoteNumber: 7,
                    noteText: 'Ti',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
