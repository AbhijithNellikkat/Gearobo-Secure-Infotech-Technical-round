import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:technical_round_app1/models/model.dart';

class UserDetailsService {
  final dio = Dio();

  String apiUrl = "https://jsonplaceholder.typicode.com/users";

  Future<List<dynamic>> fetchDatas() async {
    try {
      var response = await dio.get(apiUrl);
      log("${response.data}");

      final res = response.data;

      return res;
    } catch (e) {
      log("Error : $e");

      return [];
    }
  }
}
