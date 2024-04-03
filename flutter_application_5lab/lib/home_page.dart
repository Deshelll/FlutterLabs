import 'package:flutter/material.dart';
import 'user_info_inherited_widget.dart';
import 'date_selection_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userInfo =
        UserInfoInheritedWidget.of(context)?.userInfo ?? UserInfo('', 0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Информация о вас'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Text(
              'Имя: ${userInfo.name.isEmpty ? '(Имя)' : userInfo.name}',
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Возраст: ${userInfo.age == 0 ? '(Возраст)' : userInfo.age}',
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Введите ваше имя',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _nameController.clear();
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              onPressed: () {
                UserInfoInheritedWidget.of(context)?.userInfo.name =
                    _nameController.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DateSelectionPage(name: _nameController.text)),
                );
              },
              child: Text('Войти', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
