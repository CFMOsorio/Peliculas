import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';
import 'package:peliculas/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier{

  String _apiKey = '4b1243c1b54b6cf031af6d23f91f890d';
  String _baseURL = 'api.themoviedb.org';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];


  MoviesProvider(){
    print('Inicializado');
    
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  getOnDisplayMovies() async{
    var url = Uri.https(_baseURL, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',

      });

  // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }



  getPopularMovies() async{
    var url = Uri.https(_baseURL, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',

      });

  // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }

}