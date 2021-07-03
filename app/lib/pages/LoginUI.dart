import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Dashboard.dart';
import '../bloc/blocs/user_bloc_provider.dart';

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

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  _SignIn createState() => _SignIn();
}

class _SignIn extends State<SignIn> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final emailFocus = FocusNode();
  final passFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.only(top: 50, bottom: 40, left: 25, right: 25),
            child: ListView(
              children: <Widget>[
                customTextField("Email", EdgeInsets.all(10), false,
                    emailController, emailFocus),
                customTextField("Password", EdgeInsets.fromLTRB(10, 10, 10, 0),
                    true, passController, passFocus),
                Container(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 60, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (emailController.text == '') {
                        showDialogBox(
                            context,
                            "Invalid Input!",
                            "Enter Email properly",
                            emailController,
                            emailFocus);
                      } else if (passController.text == '') {
                        showDialogBox(
                            context,
                            "Invalid Input!",
                            "Enter Password properly",
                            passController,
                            passFocus);
                      } else {
                        print(emailController.text);
                        print(passController.text);

                        emailController.clear();
                        passController.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                      }
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

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confPassController = TextEditingController();
  //final stateController = TextEditingController();
  final nameController = TextEditingController();
  final typeController = TextEditingController();
  // final distController = TextEditingController();

  final emailFocus = FocusNode();
  final passFocus = FocusNode();
  final confPassFocus = FocusNode();
  // final stateFocus = FocusNode();
  final nameFocus = FocusNode();
  final typeFocus = FocusNode();
  // final distFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.only(top: 50, bottom: 40, left: 25, right: 25),
            child: ListView(
              children: <Widget>[
                customTextField("Email", EdgeInsets.all(10), false,
                    emailController, emailFocus),
                customTextField("Full Name", EdgeInsets.fromLTRB(10, 10, 10, 0),
                    false, nameController, nameFocus),
                // customTextField("State", EdgeInsets.fromLTRB(10, 40, 10, 0),
                //     false, stateController, stateFocus),
                // customTextField("District", EdgeInsets.fromLTRB(10, 0, 10, 0),
                //     false, distController, distFocus),
                customTextField(
                    "Farmer/Scientist",
                    EdgeInsets.fromLTRB(10, 0, 10, 0),
                    false,
                    typeController,
                    typeFocus),
                customTextField("Password", EdgeInsets.fromLTRB(10, 0, 10, 0),
                    true, passController, passFocus),
                customTextField(
                    "Confirm Password",
                    EdgeInsets.fromLTRB(10, 0, 10, 0),
                    true,
                    confPassController,
                    confPassFocus),
                Container(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 60, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (emailController.text == '') {
                        showDialogBox(
                            context,
                            "Invalid Input!",
                            "Enter Email properly",
                            emailController,
                            emailFocus);
                      } else if (nameController.text == '') {
                        showDialogBox(context, "Invalid Input!",
                            "Enter Name properly", nameController, nameFocus);
                      } else if (typeController.text == '') {
                        showDialogBox(
                            context,
                            "Invalid Input!",
                            "Enter Farmer or Scientist",
                            typeController,
                            typeFocus);
                      } else if (passController.text == '') {
                        showDialogBox(
                            context,
                            "Invalid Input!",
                            "Enter Password properly",
                            passController,
                            passFocus);
                      } else if (confPassController.text == '') {
                        showDialogBox(
                            context,
                            "Invalid Input!",
                            "Enter Confirm Password properly",
                            confPassController,
                            confPassFocus);
                      } else {
                        print(emailController.text);
                        print(nameController.text);
                        // print(stateController.text);
                        // print(distController.text);
                        print(typeController.text);
                        print(passController.text);
                        print(confPassController.text);
                        emailController.clear();
                        nameController.clear();
                        // stateController.clear();
                        // distController.clear();
                        typeController.clear();
                        passController.clear();
                        confPassController.clear();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                      }
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
              ],
            )));
  }
}

Widget customTextField(String hintText, EdgeInsets padd, bool obscureText,
    TextEditingController controller, FocusNode focus) {
  return Container(
    padding: padd,
    child: TextField(
      focusNode: focus,
      controller: controller,
      obscureText: obscureText,
      keyboardType:
          hintText == "Email" ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        fillColor: Colors.white,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF000000)),
        ),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 16.0, color: Color(0x77241332)),
      ),
    ),
  );
}

Future showDialogBox(
    BuildContext context,
    String errorTitle,
    String errorMessage,
    TextEditingController controller,
    FocusNode textFocus) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(errorTitle),
          content: new Text(errorMessage),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
                controller.clear();
                textFocus.requestFocus();
              },
            ),
          ],
        );
      });
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
