import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'loadingscreen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'CineBot'
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(

          children: <Widget>[
            Container(
              padding: EdgeInsets.all(60.0),
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon(
                    Icons.movie,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  hintText: 'Search movies...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value){
                  movie=value;
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: RaisedButton(
                    child: Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.red,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return LoadingScreen(
                          moviename: movie,
                        );
                      }));
                    },
                  ),
                ),
              ],
            )
          ],
        ),

      ),
    );
  }
}
