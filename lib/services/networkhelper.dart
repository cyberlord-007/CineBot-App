import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper{
  NetworkHelper(this.url);
  final String url;
  Future <dynamic> getmovieData() async{
    http.Response response = await http.get(url);
    if(response.statusCode==200){
      String data = response.body;
      var movieData = jsonDecode(data);
      return movieData;
    }
    else{
      print(response.statusCode);
    }
  }
}