
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedatabase1/data/models/movies.dart';
import 'package:flutter_moviedatabase1/ui/screen/detail_screen.dart';

class ItemMovie extends StatelessWidget{
  final Movie movie;
  const ItemMovie(this.movie);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print('tapped to movie:${movie.title}');
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailPage(
                movie: movie,
              )));
//     Navigator.pushNamed(context, DetailPage.routerName, arguments:{'category': category }  );
        },
        splashColor: Colors.blueGrey, // hien mau khi nhan vao image

        child: Container(
          //color: Colors.blue,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w500${movie.poster_path}'),
                  fit: BoxFit.cover
              )

          ),
        )
    );
  }
  }

