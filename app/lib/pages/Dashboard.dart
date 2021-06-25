import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xffE6E6E1),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(100),
            child: Text("Top bar"),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: SizedBox.expand(
                child: ListView.separated(
                  itemCount: 30,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    height: 24,
                    color: Color(0xffE6E6E1),
                  ),
                  itemBuilder: (context, index) {
                    return getCard(context);
                  },
                ),
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

Widget getCard(context) {
  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
        CustomListItem(
          subtitle: 'Local Name',
          thumbnail: Container(
            child: CircleAvatar(
              radius: 35,
              foregroundImage: AssetImage('assets/Login_Back.png'),
            ),
          ),
          title: 'Tomato',
          isFavourite: true,
        ),
        Container(
            padding: EdgeInsets.fromLTRB(60, 0, 20, 0),
            child: Divider(
              height: 50,
              color: Color(0x55000000),
            )),
        ElevatedButton(
            child: Container(
              padding: EdgeInsets.fromLTRB(55, 0, 55, 0),
              child: Text(
                'Details',
                style: TextStyle(fontFamily: "SFProText"),
              ),
            ),
            onPressed: () {/* ... */},
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )))),
        Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
      ],
    ),
  );
}

class CustomListItem extends StatefulWidget {
  final Widget thumbnail;
  final String title;
  final String subtitle;
  final bool isFavourite;
  const CustomListItem({
    Key key,
    this.thumbnail,
    this.title,
    this.subtitle,
    this.isFavourite,
  }) : super(key: key);

  @override
  _CustomListItem createState() => _CustomListItem(
        thumbnail: this.thumbnail,
        title: this.title,
        subtitle: this.subtitle,
        isFavourite: this.isFavourite,
      );
}

class _CustomListItem extends State<CustomListItem> {
  final Widget thumbnail;
  final String title;
  final String subtitle;
  bool isFavourite = false;
  _CustomListItem({
    this.thumbnail,
    this.title,
    this.subtitle,
    this.isFavourite,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: widget.thumbnail,
          ),
          Expanded(
            flex: 3,
            child: TitleText(
              title: title,
              subtitle: subtitle,
            ),
          ),
          IconButton(
            icon: new Icon(Icons.favorite),
            color: isFavourite ? Color(0xffe31b23) : Color(0x40000000),
            onPressed: () {
              setState(() {
                isFavourite = !isFavourite;
              });
              print(isFavourite);
            },
          ),
        ],
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            subtitle,
            style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: Color(0x80000000)),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
        ],
      ),
    );
  }
}
