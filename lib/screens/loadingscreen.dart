import 'package:flutter/material.dart';
import 'package:cinebot1app/services/networkhelper.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'mainscreen.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({this.moviename});
  final moviename;
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getmovieData(widget.moviename);
  }

  void getmovieData(String moviename) async{
    NetworkHelper networkHelper=NetworkHelper('http://www.omdbapi.com/?t=$moviename&apikey=1eb6c6b2');
    var movieData = await networkHelper.getmovieData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
     return MainScreen(
       movieInfo: movieData,
     );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
