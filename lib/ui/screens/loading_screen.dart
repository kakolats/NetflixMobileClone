import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:netflix/repositories/data_repository.dart';
import 'package:netflix/shared/constants.dart';
import 'package:netflix/ui/screens/home_screen.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({ Key? key }) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }
  Future<void> initData() async{
    final dataProvider = Provider.of<DataRepository>(context,listen: false);
    await dataProvider.initData();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
      return HomeScreen();
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