import 'dart:developer';

import 'package:dio/dio.dart';

class UserDetailsService {
  final dio = Dio();

  String apiUrl = "https://jsonplaceholder.typicode.com/users";

  Future<List<dynamic>> fetchDatas() async {
    try {
      var response = await dio.get(apiUrl);
      log("${response.data}");

      log("StatusCode : ${response.statusCode}");

      if (response.statusCode == 200) {
        final res = response.data;

        return res;
      } else {
        return [];
      }
    } catch (e) {
      log("Error : $e");

      return [];
    }
  }
}
