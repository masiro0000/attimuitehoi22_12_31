import 'dart:math';

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
      home: const AttimuitePage(),
    );
  }
}

class AttimuitePage extends StatefulWidget {
  const AttimuitePage({super.key});

  @override
  State<AttimuitePage> createState() => _AttimuitePageState();
}

class _AttimuitePageState extends State<AttimuitePage> {
  /// 単語の区切りは大文字になっていた方がよいです
  /// myhand -> myHand
  String myhand = '👆'; // <- 絵文字を使っていてかわいい！

  /// 意味的には computeHand -> computerHand のほうがよいかも
  String computeHand = '👆';

  int win = 0;

  void selectHand(String selectedHand) {
    myhand = selectedHand;
    print(myhand);
    generateComputerHand();
    judge();
    setState(() {});
  }

  void generateComputerHand() {
    /// スペルミス！
    /// rndomNumber -> randomNumber
    final rndomNumber = Random().nextInt(4);
    computeHand = randomNumberToHand(rndomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '👆';
      case 1:
        return '👈';
      case 2:
        return '👇';
      case 3:
        return '👉';
      default:
        return '😃';
    }
  }

  /// 関数や変数の上にコメントを書くなら /// スラッシュは3つの方が良い
  /// 理由はこちらをご覧ください！ https://www.cresc.co.jp/tech/java/Google_Dart2/language/comments/comments.html
  // 勝敗判定の関数
  void judge() {
    if (myhand == computeHand) {
      // <- 簡潔な条件分岐で素晴らしい
      win = 0;
    } else {
      win = win + 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('あっちむいてほい！'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 文字列の集まりなので、Text.richを使って下揃えにしたほうがベースラインがそろっていて気持ちいい
            Text.rich(TextSpan(children: [
              const TextSpan(text: '勝利スコア : '),
              TextSpan(
                text: '$win',
                style: const TextStyle(
                  fontSize: 32,
                ),
              ), // toString を使わず $win とかいた方が簡潔！
              const TextSpan(text: ' 回'),
            ])),
            const SizedBox(height: 48),
            Text(
              computeHand,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 48),
            Text(
              myhand,
              style: const TextStyle(
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectHand('👆');
                  },
                  child: const Text('👆'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('👈');
                  },
                  child: const Text('👈'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('👇');
                  },
                  child: const Text('👇'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('👉');
                  },
                  child: const Text('👉'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('上'),
                Text('左'),
                Text('下'),
                Text('右'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
