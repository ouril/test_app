import 'package:flutter/material.dart';
import 'package:test_app/repository/models.dart';
import 'package:test_app/repository/repository.dart';
import 'package:test_app/ui/chat_screen.dart';
import 'package:test_app/ui/widgets/user_list_item.dart';
import 'package:test_app/utils/di.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  TestRepository _repository;
  ScrollController _scrollUsersController;
  ScrollController _scrollToDoController;
  TabController _tabController;

  double _scrolUserPosition = 0;
  double _scrolToDoPosition = 0;

  List<Widget> _tabs;

  Set<User> choisenUsers = Set();

  @override
  void initState() {
    super.initState();
    _scrollUsersController = ScrollController();
    _scrollToDoController = ScrollController();
    _tabController = TabController(length: 2, vsync: this);
    _scrollUsersController.addListener(() {
      if (_scrollUsersController.position != null &&
          _scrollUsersController.position.pixels != null)
        _scrolUserPosition = _scrollUsersController.position.pixels;
    });
    _scrollToDoController.addListener(() {
      if (_scrollToDoController.position != null &&
          _scrollToDoController.position.pixels != null)
        _scrolToDoPosition = _scrollToDoController.position.pixels;
    });

    _tabController.addListener(() async {
      if (_tabController.index == 0) {
        _scrollUsersController.jumpTo(_scrolUserPosition);
      }
      if (_tabController.index == 1) {
        choisenUsers.clear();
        _scrollToDoController.jumpTo(_scrolToDoPosition);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _repository ??= RepositoryProvider.of(context).repository;
    _tabs ??= [_buildUsersTab(context), _buildToDosTab(context)];
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                title: Text("Test App"),
                bottom: TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("USERS"),
                      ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("TODOS"),
                      ),
                    ),
                  ],
                )),
            body: 
                TabBarView(controller: _tabController, children: _tabs),
              
            ));
  }

  Widget _buildUsersTab(BuildContext context) => Container(
    child:
            
            StreamBuilder(
              stream: _repository.usersStream.stream,
              builder: (BuildContext context, AsyncSnapshot<UserList> snapshot) {
                if (!snapshot.hasData) {
                  _repository.getUserList();
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                
                List<Widget> listItems = snapshot.data.userList
                    .map((indexItem) => ListItem(
                          user: indexItem,
                          isChosen: choisenUsers.contains(indexItem),
                          callback: () {
                            if (choisenUsers.contains(indexItem))
                              choisenUsers.remove(indexItem);
                            else
                              choisenUsers.add(indexItem);
                          },
                        ))
                    .toList();
                return Stack(children: <Widget>[
         ListView(
                    controller: _scrollUsersController, children: listItems),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: FloatingActionButton(
                        child: Icon(Icons.chat),
                        onPressed: () {
                          
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen(
                                        users: choisenUsers.toList(),
                                      )));
                        },
                  ),
                      ),
                    ),
                ],);
                
       
              }),
            
    
  );

  Widget _buildToDosTab(BuildContext context) => Container(
        child: StreamBuilder(
          stream: _repository.todoListStream.stream,
          builder: (BuildContext context, AsyncSnapshot<ToDoList> snapshot) {
            if (!snapshot.hasData) {
              _repository.getToDos();
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              child: ListView.builder(
                  controller: _scrollToDoController,
                  itemCount: snapshot.data.todoList.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(snapshot.data.todoList[index].title),
                        trailing: snapshot.data.todoList[index].completed
                            ? Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.do_not_disturb_on,
                              ),
                      )),
            );
          },
        ),
      );

  @override
  void dispose() {
    _tabController.dispose();
    _scrollUsersController.dispose();
    _scrollToDoController.dispose();
    super.dispose();
  }
}
