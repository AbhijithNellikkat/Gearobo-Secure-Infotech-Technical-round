import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:technical_round_app1/models/user_model.dart';

const String baseUrl = "https://jsonplaceholder.typicode.com/users";

class UsersService {
  final Dio dio = Dio();

  Future<List<dynamic>> fetchAllUsers() async {
    try {
      final Response response = await dio.get(baseUrl);
      log("Status Code : ${response.statusCode}");

      if (response.statusCode == 200) {
        log("fetch the all users successfully");
        final List<dynamic> users =
            (response.data).map((user) => UsersModel.fromJson(user)).toList();

        return users;
      } else {
        throw Exception('Failed to load all users');
      }
    } catch (e) {
      log("Error form Service  : $e");

      rethrow;
    }
  }
}
