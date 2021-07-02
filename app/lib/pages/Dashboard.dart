import 'package:flutter/material.dart';

import './Dashboard.main.dart';
import './Dashboard.settings.dart';
import './Dashboard.devices.dart';
import './Dashboard.chat.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _Dashboard createState() => _Dashboard();
}

Widget drawerIcon(BuildContext context) {
  return Transform.translate(
    offset: Offset(-2, 10),
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
  );
}

class _Dashboard extends State<Dashboard> {
  int tabIndex = 0;
  List<Widget> listScreens;
  @override
  void initState() {
    super.initState();
    listScreens = [
      MainPage(),
      DevicesPage(),
      ChatPage(),
      SettingsPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: createSideDrawer(context),
        floatingActionButton: drawerIcon(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: listScreens[tabIndex],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Color(0xff9222B9),
            unselectedItemColor: Color(0xffC8C7CC),
            backgroundColor: Colors.white,
            currentIndex: tabIndex,
            onTap: (int index) {
              setState(() {
                tabIndex = index;
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: new Image.asset("assets/navHome.png"),
                  label: '',
                  activeIcon: new Image.asset("assets/navHomeActive.png")),
              BottomNavigationBarItem(
                  icon: new Image.asset("assets/navDevices.png"),
                  label: '',
                  activeIcon: new Image.asset("assets/navDevicesActive.png")),
              BottomNavigationBarItem(
                  icon: new Image.asset("assets/navChat.png"),
                  label: '',
                  activeIcon: new Image.asset("assets/navChatActive.png")),
              BottomNavigationBarItem(
                  icon: new Image.asset("assets/navSettings.png"),
                  label: '',
                  activeIcon: new Image.asset("assets/navSettingsActive.png")),
            ]),
      ),
    );
  }
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
