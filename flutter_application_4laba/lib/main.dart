import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Задачи'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          bool isEven = index % 2 == 1;
          return ListTile(
            leading: Icon(
              isEven ? Icons.chat : Icons.chat_bubble,
              color: isEven ? Colors.black : Colors.grey,
            ),
            title: Text('Задача: $index'),
            subtitle: Text('Описание: $index'),
            enabled: isEven,
            trailing: isEven
                ? Icon(Icons.chevron_right, color: Colors.black)
                : Icon(Icons.chevron_right, color: Colors.grey),
          );
        },
      ),
    );
  }
}
