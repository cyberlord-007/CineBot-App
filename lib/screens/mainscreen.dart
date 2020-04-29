import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cinebot1app/screens/searchscreen.dart';

class MainScreen extends StatefulWidget {

  MainScreen({this.movieInfo});
  final movieInfo;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  String name;
  String year;
  String posterURL;
  String imdb;
  String release;
  String duration;
  String title;
  String plot;

  @override
  void initState() {
    super.initState();
    updateUI(widget.movieInfo);
  }

  void updateUI(dynamic movieInfo){
    setState(() {

      year = movieInfo['Year'].toString();
      posterURL = movieInfo['Poster'].toString();
      imdb = movieInfo['Ratings'][0]['Value'].toString();
      release = movieInfo['Released'].toString();
      duration = movieInfo['Runtime'].toString();
      title = movieInfo['Title'].toString();
      plot = movieInfo['Plot'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/gradient.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 60, 10, 60),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(posterURL),
                ),
                SizedBox(
                  height:10.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.imdb,
                            color: Colors.grey,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$imdb',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.calendar,
                            color: Colors.grey,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$release',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.solidClock,
                            color: Colors.grey,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$duration',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  '$title',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\" $plot \" ',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                ),
                RaisedButton(
                    child: Text(
                        'Back'
                    ),
                    color: Colors.teal
                    ,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return SearchScreen();
                      }));
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



