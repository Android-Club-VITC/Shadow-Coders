import 'package:flutter/material.dart';
import 'package:shadow_coders/widgets/button.dart';
import 'game_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: CustomButton(
        text: 'START',
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const GameScreen(),
            ),
          );
        },
        backgroundColor: Colors.amber,
      )),
    );
  }
}
