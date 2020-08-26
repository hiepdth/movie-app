

import 'package:equatable/equatable.dart';

class Movie extends Equatable{
  int id;
  String title;
  String poster_path;
  String overview;
  String release_date;
//  double vote_average;
  String backdrop_path;
//  Movie({this.id, this.title, this.poster_path, this.overview, this.release_date, this.vote_average, this.backdrop_path});
  Movie({this.id, this.title, this.poster_path, this.overview, this.release_date, this.backdrop_path});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      poster_path: json['poster_path'],
      overview: json['overview'],
      release_date: json['release_date'],
//      vote_average: json['vote_average'],
      backdrop_path: json['backdrop_path'],
    );
  }

  @override
  String toString() {
    return 'Movie{id:${id}}';
  }

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
