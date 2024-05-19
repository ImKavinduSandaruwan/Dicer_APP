import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("Dicee"),
          backgroundColor: Colors.redAccent,
        ),
        body: DicePage(),
      ),
    )
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 4;
  int score = 0;

  void generateRandomNum(){
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
      if(leftDice == 6 && rightDice == 6){
        score++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "You have got $score times \nSixes in both dices",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        generateRandomNum();
                      },
                      child: Image.asset("images/dice$leftDice.png"),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      generateRandomNum();
                    },
                    child: Image.asset("images/dice$rightDice.png"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

