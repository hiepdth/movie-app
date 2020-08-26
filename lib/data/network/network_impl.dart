import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_moviedatabase1/data/models/movies.dart';
import 'network.dart';
import 'package:http/http.dart' as http;

class Network {
  Network() {}

  //Todo: Api 1 - Lay du lieu cua popular hoac top rate movies (tra ve list movie)
  static List<Movie> _computeMovies(dynamic body) =>
      List<Movie>.from(body.map((movie) => Movie.fromJson(movie)));

  Future<List<Movie>> getListMovies(String type, int page) async {
    var url = Uri.https("api.themoviedb.org", '/3/movie/${type}',
        {'api_key': "bcb85669337da7abef016c8d330ff7d0", 'language': 'en-US', 'page': '$page'});
    print(url);
    var response = await http.get(url);

    var body = json.decode(response.body);
    return compute(_computeMovies, body['results']);
  }

  List<Movie> movie;
  Future<List<Movie>> getMoviesFromServer({int page, int limit}) async {
    if(limit <= 0) return [];
    await Future.delayed(Duration(seconds: 2));
    return movie.skip((page -1)*limit).take(limit).toList();

  }
  //Todo: Api 2 - Lay du lieu khi tim kiem (tra ve list movie)
  Future<List<Movie>> getSearchResult(String query) async {
    var url = Uri.https("api.themoviedb.org", '/3/search/movie',
        {'api_key': "bcb85669337da7abef016c8d330ff7d0", 'query': query});

    var response = await http.get(url);

    var body = json.decode(response.body);

    return compute(_computeMovies, body['results']);
  }
}
