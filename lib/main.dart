import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AttimuitePage(),
    );
  }
}
class AttimuitePage extends StatefulWidget {
  const AttimuitePage({super.key});

  @override
  State<AttimuitePage> createState() => _AttimuitePageState();
}

class _AttimuitePageState extends State<AttimuitePage> {
  String myhand = '๐';

  String computeHand = '๐';

  int win = 0;

  void selectHand (String selectedHand) {
    myhand = selectedHand;
    print(myhand);
    generateComputerHand();
    judge();
    setState(() {
    });
  }

  void generateComputerHand(){
    final rndomNumber = Random().nextInt(4);
    computeHand = randomNumberToHand(rndomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch(randomNumber) {
      case 0:
        return '๐';
      case 1:
        return '๐';
      case 2:
        return '๐';
      case 3:
        return '๐';
      default:
        return '๐';
    }
  }

  // ๅๆๅคๅฎใฎ้ขๆฐ
  void judge(){
    if( myhand == computeHand ) {
      win = 0;
    } else {
      win = win + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text('ใใฃใกใใใฆใปใ๏ผ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ๅๅฉในใณใข : '),
                Text(win.toString(),
                style: TextStyle(
                  fontSize: 32,
                ),),
                Text(' ๅ'),
              ],
            ),
            SizedBox(height: 48),
            Text(
              computeHand,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(height: 48),
            Text(
              myhand,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand('๐');
                  },
                  child: Text('ไธ'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('๐');
                  },
                  child: Text('ๅทฆ'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('๐');
                  },
                  child: Text('ไธ'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('๐');
                  },
                  child: Text('ๅณ'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}