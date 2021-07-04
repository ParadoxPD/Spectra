import 'package:app/models/classes/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserDataPage extends StatefulWidget {
  final User user;
  UserDataPage({Key key, this.user}) : super(key: key);

  @override
  _UserDataPage createState() => _UserDataPage(user: this.user);
}

class _UserDataPage extends State<UserDataPage> {
  User user;
  _UserDataPage({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xff32CE89),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(child: Text("Full Name : " + user.name)),
              Container(child: Text("Email : " + user.email)),
              Container(child: Text("Type : " + user.type)),
            ],
          ),
        ),
      ),
    );
  }
}
