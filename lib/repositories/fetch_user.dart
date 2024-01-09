//  //
//  Import LIBRARIES
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
//  Import FILES
import '../models/user.dart';
//  PARTS
//  PROVIDERS

//

Future<List<User>> fetchUsers() async {
  try {
    const String url = 'https://jsonplaceholder.typicode.com/users';
    final Response response = await Dio().get(url);
    final List userList = response.data;
    debugPrint(userList[0]);

    final users = [for (final user in userList) User.fromJson(user)];
    debugPrint(users[0].toString());

    return users;
  } catch (e) {
    rethrow;
  }
}
