import 'package:flutter/material.dart';

class CongratulationsPage extends StatelessWidget {
  final int starRating;

  CongratulationsPage({required this.starRating});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Поздравляем с завершением тренировки!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Поздравляем с завершением тренировки!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Ваша оценка: $starRating/5',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => IconButton(
                  icon: Icon(
                    index < starRating ? Icons.star : Icons.star_border,
                    size: 36,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    // Оценить тренировку (здесь можно добавить логику сохранения оценки)
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
