import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xffF0F0EE),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(100),
            child: Text("Top bar"),
          ),
          Expanded(
            child: SizedBox.expand(
              child: ListView(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
                children: getCards(context),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Text("Top bar"),
          ),
        ],
      ),
    ));
  }
}

List<Widget> getCards(context) {
  List<Widget> cards = [];

  for (var i = 0; i < 10; i++) {
    cards.add(Card(
      elevation: 10,
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                        image: AssetImage('assets/Login_Back.png'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(75.0)),
                    boxShadow: [
                      BoxShadow(blurRadius: 7.0, color: Colors.black)
                    ]),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Details"),
          ),
        ],
      ),
    ));
  }

  return cards;
}
