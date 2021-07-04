import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DevicesPage extends StatefulWidget {
  DevicesPage({Key key}) : super(key: key);

  @override
  _DevicesPage createState() => _DevicesPage();
}

class _DevicesPage extends State<DevicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            "Feature Yet to be added",
            style: TextStyle(fontSize: 26),
          ),
        ),
      ),
    );
  }
}
