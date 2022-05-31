import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/models/movies.dart';
import 'package:netflix/repositories/data_repository.dart';
import 'package:netflix/services/api_service.dart';
import 'package:netflix/shared/constants.dart';
import 'package:netflix/ui/screens/details_loading_screen.dart';
import 'package:netflix/ui/screens/movie_details_screen.dart';
import 'package:netflix/ui/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    final  dataProvider = Provider.of<DataRepository>(context);
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
            child: dataProvider.popularMovieList.isEmpty
            ?const Center(child: Text("Indisponibilite du service"))
            :GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DetailsLoadingScreen(movie: dataProvider.popularMovieList[0]))
                    );
                  },
                  child: MovieCard(movie: dataProvider.popularMovieList[0])
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Tendances actuelles",
            style: GoogleFonts.poppins(
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
                child: dataProvider.popularMovieList.isEmpty
                ?const Center(child: Text("Indisponibilite du service"),):
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DetailsLoadingScreen(movie: dataProvider.popularMovieList[index]))
                    );
                  },
                  child: MovieCard(movie: dataProvider.popularMovieList[index])
                ),
              )),
            )
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Actuellement au cinéma",
            style: GoogleFonts.poppins(
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
                child: dataProvider.playingMovieList.isEmpty
                ?const Center(child: Text("Indisponibilite du service"),):
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DetailsLoadingScreen(movie: dataProvider.playingMovieList[index]))
                    );
                  },
                  child: MovieCard(movie: dataProvider.playingMovieList[index])
                ),
              )),
            )
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Ils arrivent bientot",
            style: GoogleFonts.poppins(
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
                child: dataProvider.upcomingMovieList.isEmpty
                ?const Center(child: Text("Indisponibilite du service"),):
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DetailsLoadingScreen(movie: dataProvider.upcomingMovieList[index]))
                    );
                  },
                  child: MovieCard(movie: dataProvider.upcomingMovieList[index])
                ),
              )),
            )
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "Animations",
            style: GoogleFonts.poppins(
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
                child: dataProvider.upcomingMovieList.isEmpty
                ?const Center(child: Text("Indisponibilite du service"),):
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => DetailsLoadingScreen(movie: dataProvider.upcomingMovieList[index]))
                    );
                  },
                  child: MovieCard(movie: dataProvider.upcomingMovieList[index])
                ),
              )),
            )
          )
        ],
      ),
    );
  }

  
}