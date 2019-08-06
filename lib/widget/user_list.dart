import 'package:flutter/material.dart';
import 'package:flutter_state_provider/model/user.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    var users = Provider.of<List<User>>(context);

    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          User user = users[index];
          return ListTile(
            title: Text("이름 -  ${user.name}"),
            leading: Text("나이 - ${user.age}"),
          );
        },
      ),
    );
  }
}