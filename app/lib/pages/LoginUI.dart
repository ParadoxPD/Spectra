import 'package:flutter/material.dart';
import '../widgets/inputWidget.dart';

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
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Welcome",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "An app that control light spectrum according to",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "you at your finger tips",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        ///holds email header and inputField
                        Text(
                          "CONTINUE WITH:",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.w300,
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                        ),
                        roundedRectButton("Email", emailGradients),
                        roundedRectButton("Facebook", facebookGradients),
                      ],
                    )
                  ],
                ))));
  }
}

Widget roundedRectButton(String title, List<Color> gradient) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
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
