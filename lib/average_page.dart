import 'dart:async';
import 'package:flutter/material.dart';
import 'congratulations_page.dart'; // Импортируем CongratulationsPage

class AveragePage extends StatefulWidget {
  @override
  _AveragePageState createState() => _AveragePageState();
}

class _AveragePageState extends State<AveragePage> {
  int _totalSeconds = 300; // 5 minutes in seconds
  int _exerciseIndex = 0;
  int _exerciseDuration = 300; // 5 minutes in seconds
  int _breakDuration = 15; // 15 seconds break
  bool _isExercise = true; // Flag to track if it's exercise or break
  bool _isFinished = false;

  List<String> exercises = [
    'Разминка',
    'Мельница',
    'Отжимание',
    'Велик лежа',
    'Черепаха',
    'Отжимания в стороны',
  ];

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_totalSeconds > 0) {
          _totalSeconds--;
          if (_totalSeconds == 0) {
            _totalSeconds = _isExercise ? _breakDuration : _exerciseDuration;
            _isExercise = !_isExercise;
            if (!_isExercise) {
              _exerciseIndex = (_exerciseIndex + 1) % exercises.length;
              if (_exerciseIndex == exercises.length - 1) {
                _isFinished = true;
                // Переход на страницу поздравления
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CongratulationsPage(starRating: 5)), // Передаем значение starRating
                ).then((_) {
                  setState(() {
                    // Сброс флага _isFinished при возвращении из CongratulationsPage
                    _isFinished = false;
                  });
                });
              }
            }
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Тренировка для средних'),
      ),
      body: Center(
        child: _isFinished
            ? SizedBox() // Теперь здесь ничего не отображается
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _isExercise ? 'Тренировка для сред уров' : 'Перерыв',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _isExercise
                        ? 'Продолжительность: ${_totalSeconds ~/ 60}:${(_totalSeconds % 60).toString().padLeft(2, '0')}'
                        : 'Продолжительность: $_totalSeconds секунд',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  _isExercise
                      ? Text(exercises[_exerciseIndex], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                      : SizedBox(),
                  SizedBox(height: 20),
                  _buildExercise(exercises[_exerciseIndex]),
                  SizedBox(height: 20),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_isFinished) {
              // Если тренировка окончена, закрываем страницу
              Navigator.pop(context);
            } else {
              _totalSeconds = _isExercise ? _breakDuration : _exerciseDuration;
              _isExercise = !_isExercise;
              if (!_isExercise) {
                _exerciseIndex = (_exerciseIndex + 1) % exercises.length;
                if (_exerciseIndex == exercises.length - 1) {
                  _isFinished = true;
                }
              }
            }
          });
        },
        child: Icon(Icons.skip_next),
      ),
    );
  }

  Widget _buildExercise(String exerciseName) {
    if (_isExercise) {
      return Image.asset(
        _getImageForExercise(exerciseName),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.8,
      );
    } else {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.8,
        child: Center(
          child: Text(
            'Отдых',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
  }

  String _getImageForExercise(String exerciseName) {
    switch (exerciseName) {
      case 'Разминка':
        return 'images/Warm-up.gif';
      case 'Мельница':
        return 'images/Warm-up2.gif';
      case 'Отжимание':
        return 'images/push-ups.gif';
      case 'Велик лежа':
        return 'images/bike lying down.gif';
      case 'Черепаха':
        return 'images/turtle.gif';
      case 'Отжимания в стороны':
        return 'images/push-ups_hard.gif';
      default:
        return 'images/Warm-up.gif';
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
