import 'dart:convert';

import 'package:http/http.dart';
import 'package:testing_bloc/cores/constant.dart';
import 'package:testing_bloc/models/user_model.dart';

abstract class UserRepoInterface {
  factory UserRepoInterface() => UserRepo();

  Future<List<User>> getListUser();
  Future<User> updateUser({
    required int id,
    required Map<String, dynamic> payload,
  });
}

class UserRepo implements UserRepoInterface {
  @override
  Future<List<User>> getListUser() async {
    Response response = await apiHelperInterface.getMethod(
      path: '/users',
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    List<User> userList = [];
    for (var userMap in data['data'] ?? []) {
      User user = User.fromJson(userMap);
      userList.add(user);
    }
    return userList;
  }

  @override
  Future<User> updateUser({
    required int id,
    required Map<String, dynamic> payload,
  }) async {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
