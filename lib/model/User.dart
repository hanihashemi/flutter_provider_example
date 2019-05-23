import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String firstName;
  String avatar;
  bool _select = false;

  User(this.firstName, this.avatar);

  User.fromJson(Map<String, dynamic> json)
      : firstName = json['first_name'],
        avatar = json['avatar'];

  bool get isSelected => _select;

  void like() {
    _select = !_select;
    notifyListeners();
  }
}
