import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../bloc/blocs/user_bloc_provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("hello"),
          backgroundColor: Colors.white,
          toolbarHeight: 100,
          iconTheme: IconThemeData(color: Color(0xff32CE89)),
        ),
        drawer: createSideDrawer(context),
        body: Container(
          color: Color(0xffE6E6E1),
          child: Column(
            children: <Widget>[
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

Widget createSideDrawer(BuildContext context) {
  return SafeArea(
    child: ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(85.0)),
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.32,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(85.0)),
                child: DrawerHeader(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  child: Container(
                    decoration: new BoxDecoration(
                      color: Color(0xff241332),
                      image: new DecorationImage(
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.36), BlendMode.dstATop),
                        image: new AssetImage("assets/Login_Back.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(40, 50, 0, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 35,
                            child: Image.asset('assets/avatar.png'),
                            backgroundColor: Color(0x00ffffff),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Text(
                              "Isaac Newton",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Text("@Newton69",
                                  style: TextStyle(
                                      color: Color(0xaaffffff), fontSize: 13)))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ), // Populate the Drawer in the next step.
      ),
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
          isFavourite: false,
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
