import 'package:flutter/cupertino.dart';
import 'package:test_app/repository/repository.dart';

class RepositoryProvider extends InheritedWidget {
  final TestRepository repository;

  RepositoryProvider(
      {Key key, @required this.repository, @required Widget child})
      : assert(repository != null),
        assert(child != null),
        super(key: key, child: child);

  static RepositoryProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RepositoryProvider>();
  }

  @override
  bool updateShouldNotify(RepositoryProvider oldWidget) =>
      repository != oldWidget.repository;
}
