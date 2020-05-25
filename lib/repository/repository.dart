import 'dart:async';

import 'package:dio/dio.dart';
import 'package:test_app/repository/api.dart';
import 'package:test_app/repository/models.dart';
import 'package:test_app/repository/repo_error.dart';


class TestRepository {
  StreamController<UserList> usersStream = StreamController.broadcast();
  StreamController<ToDoList> todoListStream =StreamController.broadcast();
  StreamController<RepositoryError> errorStream = StreamController.broadcast();

  Dio _dio = Dio();

  _getData(VoidCallback callback) async {
    try {
      callback();
    } on DioError catch (e) {
      final error = RepositoryError(msg: e.message, type: ErrorType.NETWORK);
      errorStream.add(error);
    }
  }

  getUserList() => _getData(() async {
        final response = await _dio.get(Api.users);
        final UserList serialized = UserList.fromJson(response.data);
        usersStream.add(serialized);
      });

  getToDos() => _getData(() async {
        final response = await _dio.get(Api.todos);
        final ToDoList serialized = ToDoList.fromJson(response.data);
        todoListStream.add(serialized);
      });

  dispose() {
    usersStream.close();
    todoListStream.close();
    errorStream.close();
  }
}
