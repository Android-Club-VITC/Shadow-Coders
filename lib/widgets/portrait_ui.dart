import 'package:flutter/material.dart';
import 'package:shadow_coders/widgets/button.dart';

class PortraitUI extends StatelessWidget {
  final int timeRemaining;
  final int score;
  final String currentWord;
  final VoidCallback passWord;
  final VoidCallback takeWord;

  const PortraitUI({
    super.key,
    required this.timeRemaining,
    required this.score,
    required this.currentWord,
    required this.passWord,
    required this.takeWord,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$timeRemaining',
          style: const TextStyle(
              fontSize: 70, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 20),
        Text(
          'Score: $score',
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 20),
        Card(
          color: Colors.blue,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.35,
            alignment: Alignment.center,
            child: Text(
              currentWord,
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              text: 'Pass',
              onPressed: passWord,
              backgroundColor: Colors.red,
            ),
            CustomButton(
              text: 'Done',
              onPressed: takeWord,
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ],
    );
  }
}
