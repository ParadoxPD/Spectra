import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: createSideDrawer(context),
      body: SafeArea(
          child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            sliverBar(context, "Issac Newton", "Scientist",
                AssetImage('assets/avatar_profile.png')),
          ];
        },
        body: Container(
          color: Color(0xffE6E6E1),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  padding: EdgeInsets.only(top: 30),
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
        ),
      )),
    );
  }
}

Widget randomizeCard(BuildContext context, int index) {
  return getCard(context);
}

Widget sliverBar(
    BuildContext context, String title, String type, AssetImage avatar) {
  return SliverAppBar(
    leading: Transform.translate(
      offset: Offset(4, 4),
      child: Transform.scale(
        scale: 1.3,
        child: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu),
            color: Color(0xff32CE89),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
    ),
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
          title,
          style: TextStyle(
              color: top == 60 ? Color(0xbb000000) : Color(0x00000000)),
        ),
        centerTitle: true,
        background: titleBar(context, avatar, title, type),
      );
    }),
  );
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
                  itemBuilder: (context, index) {
                    return getCard(context);
                  },
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

Widget titleBar(
    BuildContext context, AssetImage avatar, String title, String type) {
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
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xee000000)),
                    ),
                  ),
                  Text(
                    type,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0x75000000)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 25),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                            child: Text(
                              "Follow",
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

Widget createSideDrawer(BuildContext context) {
  return SafeArea(
    child: ClipRRect(
      borderRadius: BorderRadius.only(topRight: Radius.circular(85.0)),
      child: Drawer(
        child: SizedBox.expand(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              sideMenuBanner(
                  context,
                  new AssetImage("assets/Login_Back.png"),
                  Image.asset('assets/avatar.png'),
                  "Isaac Newton",
                  "@Newton69"),
              Padding(padding: EdgeInsets.only(top: 30)),
              sideMenuTile("Home", ImageIcon(AssetImage('assets/home.png')),
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400), () {}),
              Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 120, 5),
                  child: ElevatedButton(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: Text(
                            "Devices",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )),
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xff3AE379)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0),
                          ))))),
              sideMenuTile(
                  "Contact Us",
                  ImageIcon(AssetImage('assets/user-minus.png')),
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  () {}),
              sideMenuTile("About Us", ImageIcon(AssetImage('assets/info.png')),
                  TextStyle(fontSize: 16, fontWeight: FontWeight.w400), () {}),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 4.7)),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: sideMenuTile(
                    "Log Out",
                    ImageIcon(AssetImage('assets/logout.png')),
                    TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0x50000000)), () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                }),
              ),
            ],
          ),
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
    margin: EdgeInsets.only(left: 25, right: 25),
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
              radius: 30,
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
