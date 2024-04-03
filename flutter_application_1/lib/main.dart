import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Мое первое приложение',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 1;
    });
  }

  void _incrementCounterHeader() {
    setState(() {
      _counter += 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мое первое приложение'),
        backgroundColor: Color(0xFFFFCDD2),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _incrementCounterHeader,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
            child: Text(
              'Нажали: $_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFFFCDD2),
      ),
    );
  }
}
