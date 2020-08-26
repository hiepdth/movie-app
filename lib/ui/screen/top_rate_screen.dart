import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedatabase1/data/models/movies.dart';
import 'package:flutter_moviedatabase1/data/network/network.dart';
import 'package:flutter_moviedatabase1/ui/screen/detail_screen.dart';

class TopRatePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      key: UniqueKey(),
      future: Network().getListMovies("top_rated", 1),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(backgroundColor: Colors.blueGrey),
          );
        } else if (snapshot.hasError) {
          // todo: handle error state
        }

        List<Movie> data = snapshot.data.sublist(0, 20);
        return TopRateWidget1(data);
      },
    );
  }
}

class TopRateWidget1 extends StatefulWidget {
  List<Movie> data;

  TopRateWidget1(this.data);

  @override
  TopRateWidgetState1 createState() => TopRateWidgetState1(data);
}

class TopRateWidgetState1 extends State<TopRateWidget1> {
  bool isLoading = false;
  List<Movie> data;
  int page = 1;

  TopRateWidgetState1(this.data);

  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        isLoading = true;
        setState(() {});
        page++;
        List<Movie> _data = await Network().getListMovies("popular", page);
        for (Movie m in _data) {
          data.add(m);
        }
        isLoading = false;
        setState(() {});
      }
    });
  }

  Future<void> refresh() async {
    CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Stack(
        children: <Widget>[
          GridView.count(
            controller: scrollController,
            padding: EdgeInsets.all(5),
            //mainAxisSpacing: 2,

            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            children: data.map((eachMovie) => itemCategory(eachMovie)).toList(),
          ),
          _loader(),
        ],
      ),
    );
  }

  Widget _loader() {
    return isLoading
        ? new Align(
            child: Container(
              width: 70.0,
              height: 70.0,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            alignment: FractionalOffset.bottomCenter,
          )
        : SizedBox(
            width: 0,
            height: 0,
          );
  }

  Widget itemCategory(Movie movie) {
    return InkWell(
      onTap: () {
        print('tap to movie: ${movie.title}');
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(
                  movie: movie,
                )));
      },
      splashColor: Colors.deepPurple,
//      child: Stack(
//        //
//        alignment: Alignment.bottomCenter,
//        children: <Widget>[
//          Expanded(
//            flex: 2,

      child: Container(
        //color: Colors.blue,
        //decoration: BoxDecoration,
        margin: const EdgeInsets.all(2),
        child: Image.network(
            'https://image.tmdb.org/t/p/w500${movie.poster_path}'),
      ),
    );
  }
}
