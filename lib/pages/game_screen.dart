import 'package:flutter/material.dart';
import 'package:shadow_coders/widgets/landscape_ui.dart';
import 'package:shadow_coders/widgets/portrait_ui.dart';
import 'package:shadow_coders/constants/words.dart';
import 'score_screen.dart';
import 'dart:math';
import 'dart:async';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<String> _passedWords = [];
  final List<String> _takenWords = [];
  String _currentWord = '';
  final Random _random = Random();
  int _score = 0;
  int _timeRemaining = 60;
  Timer? _timer;
  bool _isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    _currentWord = _getRandomWord();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _getRandomWord() {
    List<String> availableWords = words
        .where((word) =>
            !_passedWords.contains(word) && !_takenWords.contains(word))
        .toList();
    if (availableWords.isEmpty) {
      _passedWords.clear();
      _takenWords.clear();
      availableWords = words;
    }
    return availableWords[_random.nextInt(availableWords.length)];
  }

  void _passWord() {
    setState(() {
      _passedWords.add(_currentWord);
      _currentWord = _getRandomWord();
    });
  }

  void _takeWord() {
    setState(() {
      _takenWords.add(_currentWord);
      _score += 10;
      _currentWord = _getRandomWord();
    });
  }

  void _restartGame() {
    setState(() {
      _passedWords.clear();
      _takenWords.clear();
      _score = 0;
      _currentWord = _getRandomWord();
      _timeRemaining = 60;
      _stopTimer();
      _startTimer();
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining--;
        } else {
          _stopTimer();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ScoreScreen(score: _score),
            ),
          );
        }
      });
    });
    setState(() {
      _isTimerRunning = true;
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _isTimerRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Detect orientation
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'ROUND 3',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 245, 198, 44),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.restart_alt,
              color: Colors.black,
            ),
            onPressed: _restartGame,
            tooltip: 'Restart Game',
          ),
          IconButton(
            icon: Icon(
              _isTimerRunning ? Icons.pause : Icons.play_arrow,
              color: Colors.black,
            ),
            onPressed: _isTimerRunning ? _stopTimer : _startTimer,
            tooltip: _isTimerRunning ? 'Pause Timer' : 'Start Timer',
          ),
        ],
      ),
      body: isLandscape
          ? LandscapeUI(
              timeRemaining: _timeRemaining,
              score: _score,
              currentWord: _currentWord,
              passWord: _passWord,
              takeWord: _takeWord,
            )
          : PortraitUI(
              timeRemaining: _timeRemaining,
              score: _score,
              currentWord: _currentWord,
              passWord: _passWord,
              takeWord: _takeWord,
            ),
    );
  }
}
