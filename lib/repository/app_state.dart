import 'package:test_app/repository/models.dart';

class AppState {
  final UserList userList;
  final ToDoList toDoList;

  AppState(this.userList, this.toDoList);
}