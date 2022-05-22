import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/models/movies.dart';
import 'package:netflix/repositories/data_repository.dart';
import 'package:netflix/services/api_service.dart';
import 'package:netflix/shared/constants.dart';
import 'package:netflix/ui/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //List<Movie>? movies;
  List<Movie>? cinema;
  List<Movie>? bientot;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCinema();
    getBientot();
  }
  
  void getCinema(){
    ApiService().getPlayingMovies(pageNumber: 1).then((movies) => {
      setState(() {
        cinema=movies;
      })
    });
  }
  void getBientot(){
    ApiService().getUpcomingMovies(pageNumber: 1).then((movies) => {
      setState(() {
        bientot=movies;
      })
    });
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
            :MovieCard(movie: dataProvider.popularMovieList[0])
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
                Image.network(dataProvider.popularMovieList[index].posterUrl(),
                fit: BoxFit.cover,),
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
                child: cinema==null
                ?const Center(child: Text("Indisponibilite du service"),):
                Image.network(cinema![index].posterUrl(),
                fit: BoxFit.cover,),
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
                child: bientot==null
                ?const Center(child: Text("Indisponibilite du service"),):
                Image.network(bientot![index].posterUrl(),
                fit: BoxFit.cover,),
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
                child: bientot==null
                ?const Center(child: Text("Indisponibilite du service"),):
                Image.network(bientot![index].posterUrl(),
                fit: BoxFit.cover,),
              )),
            )
          )
        ],
      ),
    );
  }

  
}