import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:technical_round_app1/services/users_serive.dart';

class UsersController extends ChangeNotifier {
  bool loading = false;
  List<dynamic> users = [];

  List<dynamic> filteredUsers = [];

  final UsersService service = UsersService();

  Future<void> fetchAllUsers() async {
    try {
      loading = true;
      notifyListeners();

      users = await service.fetchAllUsers();
      filteredUsers = List.from(users);

      loading = false;
      notifyListeners();
    } catch (e) {
      loading = true;
      notifyListeners();
      log('Error from UsersController : $e');
    }
  }

  void sortUsersByEmail() {
    users.sort((a, b) => a.email.compareTo(b.email));
    filteredUsers.sort((a, b) => a.email.compareTo(b.email));
    notifyListeners();
  }

  void sortUsersByName() {
    users.sort((a, b) => a.name.compareTo(b.name));
    filteredUsers.sort((a, b) => a.name.compareTo(b.name));
    notifyListeners();
  }

  void searchUsers(String query) {
    if (query.isEmpty) {
      filteredUsers = List.from(users);
    } else {
      filteredUsers = users
          .where((user) =>
              user.name!.toLowerCase().contains(query.toLowerCase()) ||
              user.email!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
