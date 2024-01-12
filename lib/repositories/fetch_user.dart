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
    await Future.delayed(const Duration(seconds: 1));
    const String url = 'https://jsonplaceholder.typicode.com/users';
    final Response response = await Dio().get(url);
    final List userList = response.data;
    debugPrint('Start of printing ----------- userList[0] ----------\n');
    debugPrint('userList[0] = $userList[0]\n');
    debugPrint('End of printing ----------- userList[0] ----------\n');

    final users = [for (final user in userList) User.fromMap(user)];
    // final users = [for (final user in userList) User.fromJson(user)];
    debugPrint('\n___________ inside for in fetch users ____________\n');
    debugPrint('\n users[0] = ${users[0].toString()}');

    return users;
  } catch (e) {
    rethrow;
  }
}
