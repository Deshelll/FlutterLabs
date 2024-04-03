import 'package:flutter/material.dart';
import 'home_page.dart';

class AgeResultPage extends StatelessWidget {
  final String name;
  final int age;

  const AgeResultPage({Key? key, required this.name, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Результат'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Имя: $name', style: TextStyle(fontSize: 22)),
            Text('Ваш возраст: $age лет', style: TextStyle(fontSize: 22)),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Вернуться на главную'),
            ),
          ],
        ),
      ),
    );
  }
}
