import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo_provider/model/User.dart';
import 'package:http/http.dart' as http;

class AppState with ChangeNotifier {
  final String _dataUrl = "https://reqres.in/api/users?per_page=20";

  bool _isFetching = false;

  bool get isFetching => _isFetching;

  List<User> users = List();

  Future<void> fetchData() async {
    _isFetching = true;
    users.clear();
    notifyListeners();

    var response = await http.get(_dataUrl);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> data = json['data'];

      data.forEach((val) => users.add(User.fromJson(val)));
    }

    _isFetching = false;
    notifyListeners();
  }
}
