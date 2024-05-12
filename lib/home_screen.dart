import 'package:flutter/material.dart';
import 'package:flutter_sport_adil/second_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SwipePages(),
      )
    );
  }
}

class SwipePages extends StatefulWidget {
  @override
  _SwipePagesState createState() => _SwipePagesState();
}

class _SwipePagesState extends State<SwipePages> {
  String button1 = 'asets/icons/a4.png';
  int kol = 0;

  void _changeButton() {
    setState(() {
      kol++;
      button1 = button1 == 'asets/icons/a4.png' ? 'asets/icons/a3.png':
        button1 == 'asets/icons/a3.png'? 'asets/icons/a2.png': 
        button1 == 'asets/icons/a2.png'? 'asets/icons/a1.png': 'asets/icons/a4.png';
    });
  }

  final PageController _controller = PageController();

  final String bigText1 = 'Тренируйтесь в любом месте';
  final String smalltext1 =
    'Вы можете заниматься дома без оборудования или в тренажерном зале.';
  final String bigText2 = 'Изучайте технику';
  final String smalltext2 =
    'Наши программы тренировок составлены профессионалами.';
  final String bigText3 = 'Оставайтесь\nсильными & здоровыми';
  final String smalltext3 =
    'Мы хотим, чтобы вы насладились программой & оставались здоровыми & позитивными.';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: [
              Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 220,),
                      Container(
                        width: 350,
                        height: 250,
                        child: Image(image: AssetImage('asets/images/logo.png'), 
                          color: Color.fromARGB(255, 75, 45, 111),
                          fit: BoxFit.cover,),
                      ),
                      SizedBox(height: 20,),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: [
                              Text('Добро пожаловать!', style: TextStyle(
                                color: Color.fromARGB(255, 75, 45, 111), fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
              //2
              Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Container(
                        width: 350,
                        height: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('asets/images/qatyn1.png'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      SizedBox(height: 30,),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: [
                              Text(bigText1, style: TextStyle(
                                color: Colors.black, fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 20,),
                              Text(smalltext1, style: TextStyle(
                                color: Colors.black, fontSize: 18,
                              ), textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
              //3
              Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Container(
                        width: 350,
                        height: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('asets/images/qatyn2.png'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      SizedBox(height: 30,),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: [
                              Text(bigText2, style: TextStyle(
                                color: Colors.black, fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: 20,),
                              Text(smalltext2, style: TextStyle(
                                color: Colors.black, fontSize: 18,
                              ), textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
              //4
              Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      Container(
                        width: 350,
                        height: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('asets/images/qatyn3.png'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(bigText3, style: TextStyle(
                                color: Colors.black, fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),textAlign: TextAlign.center),
                              SizedBox(height: 20,),
                              Text(smalltext3, style: TextStyle(
                                color: Colors.black, fontSize: 18,
                              ), textAlign: TextAlign.center,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ],
          ),
        ),
        kol == 1?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.circle, size: 12, color: const Color.fromARGB(255, 99, 88, 225),),
                          SizedBox(width: 8,),
                          Icon(Icons.circle, size: 12, color: const Color.fromARGB(255, 99, 88, 225).withOpacity(0.3),),
                          SizedBox(width: 8,),
                          Icon(Icons.circle, size: 12, color: const Color.fromARGB(255, 99, 88, 225).withOpacity(0.3)),
                        ],
                      ): kol == 2?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.circle, size: 12, color: const Color.fromARGB(255, 99, 88, 225).withOpacity(0.3),),
                          SizedBox(width: 8,),
                          Icon(Icons.circle, size: 12, color: const Color.fromARGB(255, 99, 88, 225),),
                          SizedBox(width: 8,),
                          Icon(Icons.circle, size: 12, color: const Color.fromARGB(255, 99, 88, 225).withOpacity(0.3)),
                        ],
                      ): kol == 3?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.circle, size: 12, color: const Color.fromARGB(255, 99, 88, 225).withOpacity(0.3),),
                          SizedBox(width: 8,),
                          Icon(Icons.circle, size: 12, color: const Color.fromARGB(255, 99, 88, 225).withOpacity(0.3)),
                          SizedBox(width: 8,),
                          Icon(Icons.circle, size: 12, color: const Color.fromARGB(255, 99, 88, 225)),
                        ],
                      ): Container(),
                      SizedBox(height: 45,),
                      InkWell(
                        borderRadius: BorderRadius.circular(100),
                        onTap: (){
                          _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
                          _changeButton();
                          kol == 4? 
                          Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(builder: (context) => SecondPage()), 
                            (route) => false
                          ): null;
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              image: AssetImage(button1.toString()),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),
      ],
    );
  }
}