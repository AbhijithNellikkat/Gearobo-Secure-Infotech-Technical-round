import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:technical_round_app1/services/users_serive.dart';

class UsersController extends ChangeNotifier {
  bool loading = false;
  List<dynamic> users = [];

  final UsersService service = UsersService();

  Future<void> fetchAllUsers() async {
    try {
      loading = true;
      notifyListeners();

      users = await service.fetchAllUsers();

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = true;
      notifyListeners();
      log('Error from UsersController : $e');
    }
  }
}
