import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netflix/models/movies.dart';
import 'package:netflix/repositories/data_repository.dart';
import 'package:netflix/shared/constants.dart';
import 'package:netflix/ui/screens/movie_details_screen.dart';
import 'package:provider/provider.dart';

class DetailsLoadingScreen extends StatefulWidget {
  final Movie movie;
  const DetailsLoadingScreen({ Key? key, required this.movie }) : super(key: key);

  @override
  State<DetailsLoadingScreen> createState() => _DetailsLoadingScreenState();
}

class _DetailsLoadingScreenState extends State<DetailsLoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }
  Future<void> initData() async{
    final dataProvider = Provider.of<DataRepository>(context,listen: false);
    await dataProvider.getCastActeurs(this.widget.movie);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
      return MovieDetailsScreen(movie:this.widget.movie);
    })));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: akolBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/netflix.png"),
          const SpinKitRing(
            color:akolPrimaryColor,
            size: 50,
          )
        ],
      ),
    );
  }
}