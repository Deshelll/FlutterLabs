import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'age_result_page.dart';
import 'user_info_inherited_widget.dart';

class DateSelectionPage extends StatefulWidget {
  final String name;

  const DateSelectionPage({Key? key, required this.name}) : super(key: key);

  @override
  _DateSelectionPageState createState() => _DateSelectionPageState();
}

class _DateSelectionPageState extends State<DateSelectionPage> {
  final TextEditingController _dateController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');

  @override
  void initState() {
    super.initState();
    if (_dateController.text.isEmpty) {
      _dateController.text = _dateFormat.format(DateTime.now());
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate;
    if (_dateController.text.isEmpty) {
      initialDate = DateTime.now();
    } else {
      try {
        initialDate = _dateFormat.parseStrict(_dateController.text);
      } catch (_) {
        initialDate = DateTime.now();
      }
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != initialDate) {
      setState(() {
        _dateController.text = _dateFormat.format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Выбор даты рождения'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '${widget.name}, добро пожаловать!',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Text(
              'Укажите вашу дату рождения:',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                hintText: 'ДД.ММ.ГГГГ',
                suffixIcon: Icon(Icons.calendar_today),
              ),
              keyboardType: TextInputType.datetime,
              onTap: () => _selectDate(context),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _calculateAgeAndNavigate(context),
              child: Text('Рассчитать возраст'),
            ),
          ],
        ),
      ),
    );
  }

  void _calculateAgeAndNavigate(BuildContext context) {
    if (_dateController.text.isNotEmpty) {
      DateTime birthDate;
      try {
        birthDate = _dateFormat.parseStrict(_dateController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Неверный формат даты'),
            content: Text('Введите дату в формате ДД.ММ.ГГГГ'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
        return;
      }

      DateTime currentDate = DateTime.now();
      int age = currentDate.year - birthDate.year;
      if (currentDate.month < birthDate.month ||
          (currentDate.month == birthDate.month &&
              currentDate.day < birthDate.day)) {
        age--;
      }

      UserInfoInheritedWidget.of(context)
          ?.updateUserInfo(UserInfo(widget.name, age));

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AgeResultPage(name: widget.name, age: age),
      ));
    }
  }
}
