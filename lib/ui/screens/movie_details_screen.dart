// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix/models/movies.dart';
import 'package:netflix/repositories/data_repository.dart';
import 'package:netflix/shared/constants.dart';
import 'package:netflix/ui/widgets/movie_actor.dart';
import 'package:netflix/ui/widgets/movie_galerie_item.dart';
import 'package:netflix/ui/widgets/movie_synopsis.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;
  const MovieDetailsScreen({ Key? key, required this.movie }) : super(key: key);
  
  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final  dataProvider = Provider.of<DataRepository>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: akolBackgroundColor,
        leading: Icon(Icons.arrow_back_ios_new)
      ),
      backgroundColor: akolBackgroundColor,
      body: ListView(
        children: [
          Text(
            this.widget.movie.name,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
          Text(
                "Genres : Action,Science Fiction, Fantastique",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w200,
                  color: Colors.white
                )
          ),
          SizedBox(height: 15),
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children:[
              SizedBox(width: 10),
              Text(
                "2022",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  backgroundColor: Colors.grey
                )
              ),
              SizedBox(width: 30),
              Text(
                "Recommandé à ${this.widget.movie.popularity} %",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                )
              )
            ]
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 341,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )),
              ),
              onPressed: (){

              },
              // ignore: prefer_const_literals_to_create_immutables
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(
                    Icons.play_arrow,
                    size: 24,
                    color: Colors.black,
                    ),
                  Text(
                    "Lecture",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black
                    ),
                  )
              ]),
              
            ),
          ),
          SizedBox(
            width: 341,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0x858686e3)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                )),
                
              ),
              onPressed: (){

              },
              // ignore: prefer_const_literals_to_create_immutables
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(
                    Icons.download,
                    size: 24
                    ),
                  Text(
                    "Telecharger la video",
                    style: TextStyle(
                      fontSize: 24
                    ),
                  )
              ]),
              
            ),
          ),
          MovieSynopsis(description: this.widget.movie.description),
          SizedBox(height: 40),
          Text("CASTING",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 228,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dataProvider.castList.length,
              itemBuilder: ((context,index)=> Container(
                width: 138,
                margin: const EdgeInsets.only(right: 10),
                color: Colors.amber,
                child: MovieActor(acteur: dataProvider.castList[index]),
              )),
            )
          ),
          SizedBox(height: 40),
          Text("GALERIE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 100,
            width: 200,
            child:ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context,index)=> Container(
                width: 200,
                margin: const EdgeInsets.only(right: 10),
                color: Colors.amber,
                child: MovieGalerieItem(),
              )),
            )
          ),
        ],
      ),
    );
  }
}