import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dice_app/view/components/dice_action_btn.dart';
import 'package:flutter_dice_app/view/components/dice_change_fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  int _diceType = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Roll the Dice d${_diceType}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const Text(
              'Value',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _rollNumber,
              child: const Text('Roll'),
            )
          ],
        ),
      ),
      floatingActionButton: DiceChangeFab(
        activeDiceType: "d$_diceType",
        distance: 100,
        children: [
          DiceActionBtn(
              text: "d6",
              icon: const Icon(Icons.forest),
              onPressed: () => _changeDiceType(6)),
          DiceActionBtn(
              text: "d10",
              icon: const Icon(Icons.inbox),
              onPressed: () => _changeDiceType(10)),
          DiceActionBtn(
              text: "d20",
              icon: const Icon(Icons.video_call),
              onPressed: () => _changeDiceType(20)),
        ],
      ),
    );
  }

  void _rollNumber() {
    setState(() {
      _counter = Random().nextInt(_diceType) + 1;
    });
  }

  void _changeDiceType(int diceType) {
    setState(() {
      _diceType = diceType;
    });
  }
}
