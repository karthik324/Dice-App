import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;

  buttonRefresh() {
    setState(() {
      rightDiceNum = Random().nextInt(6) + 1;
      leftDiceNum = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  child: Image.asset('images/dice$leftDiceNum.png'),
                  onPressed: () {
                    buttonRefresh();
                  },
                ),
              ),
              Expanded(
                child: TextButton(
                  child: Image.asset('images/dice$rightDiceNum.png'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
        const Text(
          'Tap the left dice to roll',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          height: 30,
        ),
        leftDiceNum > rightDiceNum
        ? const Text(
           'You Won !!',
            style: TextStyle(color: Colors.white),
            )
            : leftDiceNum == rightDiceNum
            ? const Text(
            'Its A Draw',
            style: TextStyle(color: Colors.white),
            )
            : const Text(
           'You Lose',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
