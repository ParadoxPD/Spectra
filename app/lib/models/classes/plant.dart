import 'package:flutter/material.dart';

class Plant {
  String name;
  Details plantDetails;
  bool isFav;
  Image avatar;

  Plant(this.name, this.plantDetails, this.isFav, this.avatar);
}

class Details {
  String desc;

  Details(this.desc);
}
