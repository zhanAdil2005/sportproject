import 'dart:async';
import 'package:flutter/material.dart';

class NoviceWorkoutPage extends StatefulWidget {
  @override
  _NoviceWorkoutPageState createState() => _NoviceWorkoutPageState();
}

class _NoviceWorkoutPageState extends State<NoviceWorkoutPage> {
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
            } else {
              _isFinished = _exerciseIndex == exercises.length - 1;
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
        title: Text('Тренировка для новичков'),
      ),
      body: Center(
        child: _isFinished
            ? _buildCongratulations()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _isExercise ? 'Тренировка для новичков' : 'Перерыв',
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
                  _buildExercise(),
                  SizedBox(height: 20),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _totalSeconds = _isExercise ? _breakDuration : _exerciseDuration;
            _isExercise = !_isExercise;
            if (!_isExercise) {
              _exerciseIndex = (_exerciseIndex + 1) % exercises.length;
            } else {
              _isFinished = _exerciseIndex == exercises.length - 1;
            }
          });
        },
        child: Icon(Icons.skip_next),
      ),
    );
  }

  Widget _buildExercise() {
    if (_isExercise) {
      return Image.asset(
        _getImageForExercise(exercises[_exerciseIndex]),
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

  Widget _buildCongratulations() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Поздравляем с завершением тренировки!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Закрыть'),
        ),
      ],
    );
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
