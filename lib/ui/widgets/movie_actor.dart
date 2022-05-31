// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/models/acteur.dart';

class MovieActor extends StatelessWidget {
  final Acteur acteur;
  const MovieActor({ Key? key, required this.acteur }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 228,
      child: Container(
        width: 140,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 158,
              width: 138,
              child: CachedNetworkImage(
                imageUrl: acteur.profileUrl(),
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const Icon(Icons.error) 
              ),
            ),
            SizedBox(
              height: 70,
              width: 138,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(acteur.originalName,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(acteur.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}