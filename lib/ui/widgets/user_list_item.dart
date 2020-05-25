import 'package:flutter/material.dart';
import 'package:test_app/repository/models.dart';
import 'package:test_app/utils/utils.dart';

class ListItem extends StatefulWidget {
  final User user;
  final VoidCallback callback;
  final bool isChosen;

  const ListItem({Key key, this.user, this.callback, this.isChosen = false}) : super(key: key);
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool isChosen = false;
  
  @override
  Widget build(BuildContext context) {
    if(widget.isChosen) isChosen = true;
    return Container(
        key: ValueKey("${widget.user.id}"),
        color: isChosen ? Colors.lightBlueAccent : Colors.white,
        child: ListTile(
          onTap: () {
            if (widget.callback != null) {
              isChosen = !isChosen;
              widget.callback();
              setState(() {});
            }
          },
          leading: CircleAvatar(
              child: Text(
            AppUtils.buildFirstLetters(widget.user.name),
          )),
          subtitle: Text(widget.user.email),
          title: Text(widget.user.name),
        ));
  }
}
