import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moviedatabase1/data/models/movies.dart';
import 'package:flutter_moviedatabase1/data/network/network_impl.dart';
import 'package:flutter_moviedatabase1/ui/screen/detail_screen.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Search Film'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      //drawer: Drawer(),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  List<Movie> data;

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: action for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
//     TODO: leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
    return Container();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: show some result based on the selection
    return Container();
  }

  //ham nay xu ly trong khi cai search thay doi
  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: so when someone search for something
//    final suggestionList = query.isEmpty
//        ? recentFilms
//        : films.where((p) => p.toLowerCase().startsWith(query.toLowerCase().trim())).toList();
    // khi khac rong thi
    if (!query.isEmpty) {
      return FutureBuilder(
        key: UniqueKey(),
        future: Network().getSearchResult(query),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // todo: handle error state
          }
          data = snapshot.data.sublist(0, 10);

          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailPage(
                          movie: data[index],
                        )));
              },
              leading: Icon(Icons.star),
              title: Text(data[index].title != null ? data[index].title : ' '),
            ),
            itemCount: data.length,
          );
        },
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.star),
          title: Text(' '),
        ),
        itemCount: 0,
      );
    }
  }
}
//currentListValue = widget.listItems
//    .where((e) => widget.listValues[widget.listItems.indexOf(e)].toLowerCase().contains(text.trim().toLowerCase()))
//.toList();
////});
