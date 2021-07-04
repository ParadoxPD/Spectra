import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key}) : super(key: key);

  @override
  _DetailsPage createState() => _DetailsPage();
}

class _DetailsPage extends State<DetailsPage> {
  @override
  double _value = 20;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        toolbarHeight: MediaQuery.of(context).size.height * 0.24,
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
        ),
        leading: Transform.translate(
          offset: Offset(0, -MediaQuery.of(context).size.height * 0.12 + 30),
          child: Transform.scale(
            scale: 1.2,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xff32CE89),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Text(
                "Spectrum",
                style: TextStyle(
                    fontSize: 30,
                    color: Color(0xdd000000),
                    fontWeight: FontWeight.normal),
              ),
              Transform.translate(
                offset: Offset(20, 30),
                child: ElevatedButton(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Text(
                        'Intensity',
                        style: TextStyle(fontFamily: "SFProText"),
                      ),
                    ),
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff9222B9)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )))),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xffF1F0F2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Slider(
            //   min: 0,
            //   max: 100,
            //   value: _value,
            //   onChanged: (value) {
            //     setState(() {
            //       _value = value;
            //     });
            //   },
            // ),

            Container(
              child: Text(
                "Feature yet to be added",
                style: TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
