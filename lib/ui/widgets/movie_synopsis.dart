// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix/shared/constants.dart';

class MovieSynopsis extends StatelessWidget {
  const MovieSynopsis({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: akolPrimaryColor,
      height: 200,
      width: 360,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text("Synopsis",
          style: TextStyle(
            fontSize: 16
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Text("Synopsis"),
          )
        ],
      )
    );
  }
}