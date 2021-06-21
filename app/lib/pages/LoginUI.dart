import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Login_Back.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 2.3),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Welcome",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                                fontSize: 36,
                                fontFamily: 'Segoe UI',
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 40)),
                            Text(
                              "An app that control light spectrum according to",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: 'Segoe UI',
                              ),
                            ),
                            Text(
                              "you at your finger tips",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                fontFamily: 'Segoe UI',
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          ///holds email header and inputField
                          Text(
                            "CONTINUE WITH:",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Segoe UI',
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                          ),
                          roundedRectButton("Email", emailGradients),
                          roundedRectButton("Facebook", facebookGradients),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                  ],
                ))));
  }
}

class EmailRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width / 1.5, 50),
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TabBar(
                unselectedLabelColor: Color(0xFF998FA2),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), // Creates border
                  color: Color(0xFF8A56AC),
                ),
                tabs: <Widget>[
                  Container(
                    height: 50,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("SIGN IN"),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(),
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("SIGN UP"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SignIn(),
            SignUp(),
          ],
        ),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.only(top: 50, bottom: 40, left: 25, right: 25),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF000000)),
                      ),
                      hintText: 'Email',
                      hintStyle:
                          TextStyle(fontSize: 16.0, color: Color(0x77241332)),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF000000)),
                      ),
                      hintText: 'Password',
                      hintStyle:
                          TextStyle(fontSize: 16.0, color: Color(0x77241332)),
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 60, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Respond to button press
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff8A56AC)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ))),
                    child: Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text('CONTINUE')),
                  ),
                ),
                Container(
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff8A56AC)),
                    ),
                    onPressed: () {},
                    child: Text('FORGOT PASSWORD'),
                  ),
                )
              ],
            )));
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.only(top: 50, bottom: 40, left: 25, right: 25),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF000000)),
                      ),
                      hintText: 'Email',
                      hintStyle:
                          TextStyle(fontSize: 16.0, color: Color(0x77241332)),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF000000)),
                      ),
                      hintText: 'Password',
                      hintStyle:
                          TextStyle(fontSize: 16.0, color: Color(0x77241332)),
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 60, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Respond to button press
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff8A56AC)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ))),
                    child: Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text('CONTINUE')),
                  ),
                ),
                Container(
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff8A56AC)),
                    ),
                    onPressed: () {},
                    child: Text('FORGOT PASSWORD'),
                  ),
                )
              ],
            )));
  }
}

Widget roundedRectButton(
  String title,
  List<Color> gradient,
) {
  return Builder(builder: (BuildContext mContext) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
          mContext,
          MaterialPageRoute(builder: (context) => EmailRoute()),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Stack(
          alignment: Alignment(1.0, 0.0),
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(mContext).size.width / 1.15,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                gradient: LinearGradient(
                    colors: gradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500)),
              padding: EdgeInsets.only(top: 16, bottom: 16),
            ),
          ],
        ),
      ),
    );
  });
}

const List<Color> emailGradients = [
  Color(0xFFAE66DD),
  Color(0xFF8A56AC),
];

const List<Color> facebookGradients = [
  Color(0xFFF692C0),
  Color(0xFFD47FA6),
];
