import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('asets/images/user.png'),
                  radius: 40,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stefani Wong',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                      Text(
                        'Lose & Fat Program',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Edit'),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Рост:\n180cm'),
                  Text('Вес:\n65kg'),
                  Text('Возраст:\n22г'),
                ],
              ),
            ),

            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Личные данные"),
              onTap: () {
                // Действие при нажатии на элемент списка
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Достижения"),
              onTap: () {
                // Действие при нажатии на элемент списка
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("История активности"),
              onTap: () {
                // Действие при нажатии на элемент списка
              },
            ),
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text("Прогресс тренировок"),
              onTap: () {
                // Действие при нажатии на элемент списка
              },
            ),
            SwitchListTile(
              title: Text("Поп-ап уведомления"),
              value: true,
              onChanged: (bool value) {
                // Действие при переключении
              },
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text("Связаться с нами"),
              onTap: () {
                // Действие при нажатии на элемент списка
              },
            ),
          ],
        ),
      ),
    );
  }
}
