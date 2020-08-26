import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedatabase1/data/models/movies.dart';

class DetailPage extends StatelessWidget {
  Movie movie;

  DetailPage({this.movie});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Detail of ${movie.title}'),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: <Widget>[
              Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.backdrop_path}'),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    movie.title,
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  movie.release_date == null
                      ? 'Release date: '
                      : 'Release date: ${movie.release_date}',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Vote average: ',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Summary ',
                    style: TextStyle(fontSize: 30),
                  )),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  '${movie.overview}',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          )),
        ));
  }
}
