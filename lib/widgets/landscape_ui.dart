import 'package:flutter/material.dart';
import 'package:shadow_coders/widgets/button.dart';

class LandscapeUI extends StatelessWidget {
  final int timeRemaining;
  final int score;
  final String currentWord;
  final VoidCallback passWord;
  final VoidCallback takeWord;

  const LandscapeUI({
    super.key,
    required this.timeRemaining,
    required this.score,
    required this.currentWord,
    required this.passWord,
    required this.takeWord,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$timeRemaining',
                style: const TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(height: 20),
              Text(
                'Score: $score',
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Card(
              color: Colors.blue,
              elevation: 4.0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.6,
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                text: 'Pass',
                onPressed: passWord,
                backgroundColor: Colors.red,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'Done',
                onPressed: takeWord,
                backgroundColor: Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
