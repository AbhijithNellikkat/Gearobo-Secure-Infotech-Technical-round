import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:technical_round_app1/services/user_details_service.dart';

class UserDetailsController extends ChangeNotifier {
  bool isLoading = true;

  List<dynamic> datas = [];

  final UserDetailsService userDetailsService = UserDetailsService();

  Future<List> fetchDatas() async {
    try {
      isLoading = true;

      datas = await userDetailsService.fetchDatas();
      notifyListeners();
      isLoading = false;

      return datas;
    } catch (e) {
      isLoading = false;
      log("$e");
      return [];
    }
  }
}
