import 'package:flutter/material.dart';
import 'package:test_app/repository/models.dart';
import 'package:test_app/ui/widgets/user_list_item.dart';

class ChatScreen extends StatelessWidget {
  final List<User> users;

  const ChatScreen({Key key, this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      body: users.isNotEmpty ? ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) =>
              ListItem(user: users[index])) : Container(),
    );
  }
}
