import 'package:flutter/material.dart';
import 'package:netflix/shared/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: akolBackgroundColor,
      appBar: AppBar(
        backgroundColor: akolBackgroundColor,
        leading: Image.asset("assets/images/Logo.png"),
      ),
      body: ListView(
        children: [
          Container(
            height: 500,
            color: akolPrimaryColor,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Tendances actuelles",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 180,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context,index)=> Container(
                width: 120,
                margin: const EdgeInsets.only(right: 10),
                color: Colors.amber,
                child: Center(child: Text(index.toString())),
              )),
            )
          ),
          const SizedBox(
            height: 15,
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Actuellement au cinéma",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 375,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context,index)=> Container(
                width: 250,
                margin: const EdgeInsets.only(right: 10),
                color: Colors.amber,
                child: Center(child: Text(index.toString())),
              )),
            )
          ),
          const Text(
            "Ils arrivent bientot",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 180,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context,index)=> Container(
                width: 120,
                margin: const EdgeInsets.only(right: 10),
                color: Colors.amber,
                child: Center(child: Text(index.toString())),
              )),
            )
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Animations",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(
            height: 180,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context,index)=> Container(
                width: 120,
                margin: const EdgeInsets.only(right: 10),
                color: Colors.amber,
                child: Center(child: Text(index.toString())),
              )),
            )
          )
        ],
      ),
    );
  }
}