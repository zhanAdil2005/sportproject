import 'package:flutter/material.dart';
import 'package:flutter_sport_adil/Statistik.dart';
import 'novice_workout_page.dart'; // Импортируем страницу для новичков
import 'beginner_page.dart'; // Импортируем страницу для начинающих
import 'average_page.dart'; // Импортируем страницу для среднего
import 'user_profile.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int _selectedIndex = 0; // Переменная для хранения текущего выбранного раздела

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Обновляем выбранный индекс при переходе между экранами
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Спорт и здоровье'),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  'Рекомендации для здорового образа жизни',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Image.asset('images/sport_image.png', fit: BoxFit.fill,),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text(
                  'Регулярные тренировки помогут вам поддерживать форму и укреплять здоровье.',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text(
                  'Рекомендации по питанию:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text(
                  '1. Употребляйте достаточное количество воды в течение дня.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text(
                  '2. Питайтесь разнообразно, включая в рацион фрукты, овощи, белковые и углеводные продукты.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: Text(
                  '3. Предпочитайте натуральные продукты производства и избегайте излишне жирных и сладких блюд.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text(
                  'Выберите ваш уровень тренировок:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              //НОВИЧОК
              InkWell(
                onTap: () {
                  _onItemTapped(0); // Вызываем метод для обновления выбранного раздела
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NoviceWorkoutPage()), // Переход на страницу для новичков
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                  width: double.infinity,
                  height: 200,
                  padding: EdgeInsets.all(0),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: _selectedIndex == 0 ? Colors.grey : Colors.black, // Подсвечиваем выбранный раздел
                        padding: EdgeInsets.all(0),
                        child: Image(
                          image: AssetImage('images/novice_rating.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Новичок', style: TextStyle(fontSize: 24, color: Colors.white)),
                              Text('4 упражнений, 20 минут', style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255))),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //НАЧИНАЮЩИЙ
              InkWell(
                onTap: () {
                  _onItemTapped(1); // Вызываем метод для обновления выбранного раздела
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BeginnerPage()), // Переход на страницу для начинающих
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  width: double.infinity,
                  height: 200,
                  color: _selectedIndex == 1 ? Colors.grey : Colors.black, // Подсвечиваем выбранный раздел
                  padding: EdgeInsets.all(0),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.black,
                        padding: EdgeInsets.all(0),
                        child: Image(
                          image: AssetImage('images/beginner_rating.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Продолжающий', style: TextStyle(fontSize: 24, color: Colors.white)),
                              Text('5 упражнений, 25 минуты', style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255))),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //СРЕДНЯЧОК
              InkWell(
                onTap: () {
                  _onItemTapped(2); // Вызываем метод для обновления выбранного раздела
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AveragePage()), // Переход на страницу для среднего
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  width: double.infinity,
                  height: 200,
                  color: _selectedIndex == 2 ? Colors.grey : Colors.black, // Подсвечиваем выбранный раздел
                  padding: EdgeInsets.all(0),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.black,
                        padding: EdgeInsets.all(0),
                        child: Image(
                          image: AssetImage('images/average_rating.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Среднячок', style: TextStyle(fontSize: 24, color: Colors.white)),
                              Text('6 упражнений, 30 минуты', style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255))),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //stop
              InkWell(
                onTap: () {
                  _onItemTapped(3); // Вызываем метод для обновления выбранного раздела
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AveragePage()), // Переход на страницу для профи
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  width: double.infinity,
                  height: 200,
                  color: _selectedIndex == 3 ? Colors.grey : Colors.black, // Подсвечиваем выбранный раздел
                  padding: EdgeInsets.all(0),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.black,
                        padding: EdgeInsets.all(0),
                        child: Image(
                          image: AssetImage('images/pro_rating.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 0, 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Профи', style: TextStyle(fontSize: 24, color: Colors.white)),
                              Text('8 упражнений, 40 минуты', style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 255, 255, 255))),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                _onItemTapped(0); // Вызываем метод для обновления выбранного раздела
              },
              icon: Icon(Icons.timer),
              tooltip: 'Тренировка',
              color: _selectedIndex == 0 ? Colors.blue : Colors.grey, // Изменяем цвет кнопки в зависимости от выбранного раздела
            ),
            IconButton(
              onPressed: () {
                _onItemTapped(1); // Вызываем метод для обновления выбранного раздела
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Statistik()),
                );
              },
              icon: Icon(Icons.bar_chart),
              tooltip: 'Статистика',
              color: _selectedIndex == 1 ? Colors.blue : Colors.grey, // Изменяем цвет кнопки в зависимости от выбранного раздела
            ),
            IconButton(
              onPressed: () {
                _onItemTapped(2); // Вызываем метод для обновления выбранного раздела
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfile()),
                );
              },
              icon: Icon(Icons.settings),
              tooltip: 'Настройки',
              color: _selectedIndex == 2 ? Colors.blue : Colors.grey, // Изменяем цвет кнопки в зависимости от выбранного раздела
            ),
          ],
        ),
      ),

    );
  }
}
