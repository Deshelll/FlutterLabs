import 'package:flutter/material.dart';

class UserInfo {
  String name;
  int age;

  UserInfo(this.name, this.age);
}

class UserInfoInheritedWidget extends InheritedWidget {
  final UserInfo userInfo;

  UserInfoInheritedWidget({
    Key? key,
    required Widget child,
    required this.userInfo,
  }) : super(key: key, child: child);

  static UserInfoInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<UserInfoInheritedWidget>();
  }

  @override
  bool updateShouldNotify(UserInfoInheritedWidget oldWidget) {
    return userInfo.name != oldWidget.userInfo.name ||
        userInfo.age != oldWidget.userInfo.age;
  }

  void updateUserInfo(UserInfo newUserInfo) {
    userInfo.name = newUserInfo.name;
    userInfo.age = newUserInfo.age;
  }
}
