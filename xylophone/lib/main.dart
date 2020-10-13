import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget addLayer({Color color, int layer}) {
    return Expanded(
      child: FlatButton(
        child: Text(''),
        onPressed: () {
          final player = AudioCache();
          player.play('note$layer.wav');
        },
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            addLayer(color: Colors.red, layer: 1),
            addLayer(color: Colors.orange, layer: 2),
            addLayer(color: Colors.green, layer: 3),
            addLayer(color: Colors.blue, layer: 4),
            addLayer(color: Colors.yellow, layer: 5),
            addLayer(color: Colors.teal, layer: 6),
            addLayer(color: Colors.purple, layer: 7),
          ],
        ),
      ),
    );
  }
}
