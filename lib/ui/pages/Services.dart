import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MyFlutterApp.dart';
class Services {
  final String name, instruction;
  final Icon imagePath;
  Services({this.imagePath, this.name, this.instruction});
}

final services= [
  [
    Services(
      imagePath: Icon(Icons.developer_mode,color: Colors.white,
        size: 30.0,),
      name: "Sagar",
      instruction: "Recruite this creator"
    ),
    Services(
      imagePath: Icon(MyFlutterApp.cart_plus,color: Colors.white,
        size: 30.0,) ,
      name: "D-Mart",
      instruction: "Call tollfree number",
    ),
    Services(
      imagePath: Icon(MyFlutterApp.power,color: Colors.white,
        size: 30.0,),
      name: "Electrician",
      instruction: "Known and trusted worker",
    ),
    Services(
      imagePath: Icon(MyFlutterApp.phone_circled,color: Colors.white,
        size: 30.0,),
      name: "Reception",
      instruction: "call the reception to verify",
    ),
  ],
  [
    Services(
        imagePath: Icon(Icons.developer_mode,color: Colors.white,
          size: 30.0,),
        name: "Sagar",
        instruction: "Recruite this creator"
    ),
    Services(
      imagePath: Icon(MyFlutterApp.phone_circled,color: Colors.white,
        size: 30.0,),
      name: "Call Security",
      instruction: "Gaurd network call",
    ),
    Services(
      imagePath: Icon(MyFlutterApp.room_service,color: Colors.white,
        size: 30.0,),
      name: "Room Services",
      instruction: "Call room service",
    ),
  ],

  [
    Services(
        imagePath: Icon(Icons.devices,color: Colors.white,
          size: 30.0,),
        name: "Sagar",
        instruction: "Recruite this creator"
    ),
    Services(
      imagePath: Icon(MyFlutterApp.local_laundry_service,color: Colors.white,
        size: 30.0,),
      name: "Laundry",
      instruction: "get Dirty Laundry Done",
    ),
    Services(
      imagePath: Icon(MyFlutterApp.more_horiz,color: Colors.white,
        size: 30.0,),
      name: "Other Services",
      instruction: "Call Staff",
    ),
  ],
];
