import 'package:flutter/material.dart';
import 'package:test_app/repository/repository.dart';
import 'package:test_app/ui/home_screen.dart';
import 'package:test_app/utils/di.dart';

void main() => runApp(TestApp());

class TestApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TestRepository testRepository = TestRepository();

    return MaterialApp(
      title: 'Test app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: RepositoryProvider(
          repository: testRepository,
          child: HomeWidget(),
        ),
      )
    );
  }
}

