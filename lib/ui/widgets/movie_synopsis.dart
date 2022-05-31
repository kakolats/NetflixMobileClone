// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix/shared/constants.dart';

class MovieSynopsis extends StatelessWidget {
  final String description;
  const MovieSynopsis({ Key? key, required this.description  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("SYNOPSIS",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Text("$description",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          )
        ],
      )
    );
  }
}