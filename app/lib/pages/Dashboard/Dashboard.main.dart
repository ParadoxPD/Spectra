import 'package:app/models/classes/user.dart';
import 'package:app/pages/Dashboard/details.dart';
import 'package:app/pages/Dashboard/userdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<CardData> data = [];
int noOfCards = 20;

class MainPage extends StatefulWidget {
  final User user;

  MainPage({Key key, this.user}) : super(key: key);

  @override
  _MainPage createState() => _MainPage(user: this.user);
}

class _MainPage extends State<MainPage> {
  User user;

  _MainPage({this.user});

  @override
  Widget build(BuildContext context) {
    createRandomCardList();
    return Scaffold(
      body: SafeArea(
          child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            sliverBar(
                context, this.user, AssetImage('assets/avatar_profile.png')),
          ];
        },
        body: Container(
          color: Color(0xffE6E6E1),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  child: SizedBox.expand(
                    child: ListView.builder(
                      itemCount: noOfCards,
                      itemBuilder: randomizeCard,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class CardData {
  String title;
  String desc;
  AssetImage avatar;
  bool isFav;
  int index;
  CardData({this.avatar, this.desc, this.isFav, this.title, this.index});
}

void createRandomCardList() {
  for (int i = 0; i < noOfCards; i++) {
    data.add(CardData(
        avatar: AssetImage('assets/Login_Back.png'),
        title: "Tomato",
        desc: "Something",
        isFav: false,
        index: i));
  }
}

Widget randomizeCard(BuildContext context, int index) {
  CardData card = data[index];
  return CardItem(
      avatar: card.avatar,
      title: card.title,
      desc: card.desc,
      isFav: card.isFav,
      index: index);
}

class CardItem extends StatefulWidget {
  final String title;
  final String desc;
  final AssetImage avatar;
  final bool isFav;
  final int index;
  CardItem(
      {Key key, this.avatar, this.desc, this.isFav, this.title, this.index})
      : super(key: key);

  _CardItem createState() => _CardItem(
      avatar: this.avatar,
      desc: this.desc,
      isFav: this.isFav,
      title: this.title,
      index: this.index);
}

class _CardItem extends State<CardItem> {
  final String title;
  final String desc;
  final AssetImage avatar;
  bool isFav;
  final int index;
  _CardItem({this.avatar, this.desc, this.isFav, this.title, this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 25, right: 25, top: 30),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
          CustomListItem(
              subtitle: this.desc,
              thumbnail: Container(
                child: CircleAvatar(
                  radius: 30,
                  foregroundImage: this.avatar,
                ),
              ),
              title: this.title,
              isFavourite: this.isFav,
              index: this.index),
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsPage()));
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xff9222B9)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )))),
          Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
        ],
      ),
    );
  }
}

List<Widget> mainBody(BuildContext context) {
  return [
    Container(
      color: Color(0xffE6E6E1),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: SizedBox.expand(
                child: ListView.separated(
                  itemCount: 30,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(
                    height: 24,
                    color: Color(0xffE6E6E1),
                  ),
                  itemBuilder: randomizeCard,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: EdgeInsets.all(30),
            child: Text("Top bar"),
          ),
        ],
      ),
    )
  ];
}

Widget sliverBar(BuildContext context, User user, AssetImage avatar) {
  return SliverAppBar(
    leading: Container(),
    expandedHeight: MediaQuery.of(context).size.height * 0.43,
    collapsedHeight: 60,
    floating: true,
    pinned: true,
    snap: false,
    elevation: 0,
    backgroundColor: Colors.white,
    flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var top = constraints.biggest.height;
      return FlexibleSpaceBar(
        title: Text(
          user.name,
          style: TextStyle(
              color: top == 60 ? Color(0xbb000000) : Color(0x00000000)),
        ),
        centerTitle: true,
        background: titleBar(context, avatar, user),
      );
    }),
  );
}

Widget titleBar(BuildContext context, AssetImage avatar, User user) {
  return SafeArea(
    child: Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Transform.translate(
              offset: Offset(-6, 10),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: CircleAvatar(
                      radius: 46,
                      foregroundImage: avatar,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      user.name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xee000000)),
                    ),
                  ),
                  Text(
                    user.type,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0x75000000)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 25),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserDataPage(user: user)),
                          );
                        },
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                            child: Text(
                              "Data",
                              style: TextStyle(fontSize: 16),
                            )),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xff9222B9)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            )))),
                  ),
                ],
              )),
          Transform.translate(
            offset: Offset(0, 10),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "5",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Color(0xee000000)),
                        ),
                        Text("Plants",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0x75000000))),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "5.0",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Color(0xee000000)),
                        ),
                        Text("Rating",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0x75000000))),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "12k",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                              color: Color(0xee000000)),
                        ),
                        Text("Followers",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0x75000000))),
                      ],
                    ),
                  ]),
            ),
          ),
        ],
      ),
    ),
  );
}

class CustomListItem extends StatefulWidget {
  final Widget thumbnail;
  final String title;
  final String subtitle;
  final bool isFavourite;
  final int index;

  const CustomListItem(
      {Key key,
      this.thumbnail,
      this.title,
      this.subtitle,
      this.isFavourite,
      this.index})
      : super(key: key);

  @override
  _CustomListItem createState() => _CustomListItem(
      thumbnail: this.thumbnail,
      title: this.title,
      subtitle: this.subtitle,
      isFavourite: this.isFavourite,
      index: this.index);
}

class _CustomListItem extends State<CustomListItem> {
  final Widget thumbnail;
  final String title;
  final String subtitle;
  bool isFavourite;
  final int index;

  _CustomListItem(
      {this.thumbnail,
      this.title,
      this.subtitle,
      this.isFavourite,
      this.index});
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
              data[this.index].isFav = this.isFavourite;
              print(this.isFavourite);
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

Widget sideMenuBanner(BuildContext context, AssetImage banner, Image avatar,
    String name, String username) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.32,
    child: ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(85.0)),
      child: DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Container(
          decoration: new BoxDecoration(
            color: Color(0xff241332),
            image: new DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.36), BlendMode.dstATop),
              image: banner,
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
                  child: avatar,
                  backgroundColor: Color(0x00ffffff),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                    name,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(username,
                        style:
                            TextStyle(color: Color(0xaaffffff), fontSize: 13)))
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget sideMenuTile(
    String title, ImageIcon icon, TextStyle style, var handleTap) {
  return InkWell(
    onTap: handleTap,
    child: Container(
      child: ListTile(
        leading: icon,
        title: Transform.translate(
            offset: Offset(-20, 0),
            child: Text(
              title,
              style: style,
            )),
      ),
    ),
  );
}
