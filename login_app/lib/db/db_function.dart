import 'package:flutter/material.dart';
import 'package:login_app/model/data_model.dart';

ValueNotifier<List<UserModel>> userListNotifier = ValueNotifier([]);

void addUser(UserModel value) {
  userListNotifier.value.add(value);
  userListNotifier.notifyListeners();
}
