import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key}) : super(key: key);

  @override
  _DetailsPage createState() => _DetailsPage();
}

class _DetailsPage extends State<DetailsPage> {
  @override
  double _rvalue = 20;
  double _gvalue = 20;
  double _bvalue = 20;
  double _ivalue = 20;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        toolbarHeight: MediaQuery.of(context).size.height * 0.24,
        // foregroundColor: Colors.white,
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
            createSlider(
              _rvalue,
              "Red",
              Color(0xffFA2A54),
              (value) {
                setState(() {
                  _rvalue = value;
                });
              },
            ),
            createSlider(
              _gvalue,
              "Green",
              Color(0xff58DD77),
              (value) {
                setState(() {
                  _gvalue = value;
                });
              },
            ),
            createSlider(
              _bvalue,
              "Blue",
              Color(0xff2665FA),
              (value) {
                setState(() {
                  _bvalue = value;
                });
              },
            ),
            createSlider(
              _ivalue,
              "Infrared",
              Color(0xff8A56AC),
              (value) {
                setState(() {
                  _ivalue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget createSlider(double _value, String colorName, Color color, onChanged) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          )),
      child: Column(
        children: [
          SliderTheme(
            data: SliderThemeData(
                thumbColor: Color(0xffBCBCBC),
                activeTrackColor: color,
                inactiveTrackColor: Color(0xffEAE7F0)),
            child: Slider(
              min: 0,
              max: 100,
              value: _value,
              onChanged: onChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Text(colorName),
                  ],
                ),
                Text("Max")
              ],
            ),
          )
        ],
      ),
    );
  }
}
