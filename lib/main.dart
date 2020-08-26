import 'package:flutter/material.dart';
import 'package:flutter_moviedatabase1/ui/screen/top_rate_screen.dart';
import 'package:flutter_moviedatabase1/ui/screen/search_screen.dart';
import 'package:flutter_moviedatabase1/ui/screen/top_rate_screen.dart';
import 'ui/screen/popular_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "movie app",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _mypage = PageController(initialPage: 0);
  int _selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: Row(
        children: <Widget>[
          buildNavBarItem(Icons.home, 0, 'Popular'),
          buildNavBarItem(Icons.star, 1, 'Top rated'),
          buildNavBarItem(Icons.search, 2, 'Search')
        ],
      ),
      body: PageView(
          controller: _mypage,
          physics: new NeverScrollableScrollPhysics(),
//        onPageChanged: (int) {
//          _selectedItemIndex = int;
//          print('Page change to index $int');
//        },
        children: <Widget>[
          PopularPage(),
//          PopularPage(),
          //TopRatedPage(),
          TopRatePage1(),
          SearchPage(),
        ],
      ),
    );
  }
  Widget buildNavBarItem(IconData icon, int index, String text) {
    //tuy  bien
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
          _mypage.jumpToPage(index);
        });
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 3,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4, color: Colors.blueGrey),
                ),
//            gradient: LinearGradient(colors: [
//              Colors.green.withOpacity(0.3),
//              Colors.green.withOpacity(0.015),
//            ],
//                begin: Alignment.bottomCenter,
//                end: Alignment.topCenter
//            )
                //color: index == _selectedItemIndex? Colors.cyan : Colors.white
              )
            : BoxDecoration(),
        child: Column(children: <Widget>[
          Icon(
            icon,
            color: index == _selectedItemIndex ? Colors.blueGrey : Colors.grey,
          ),
          Text(
            text,
            style: TextStyle(
                color: index == _selectedItemIndex ? (Colors.blueGrey ) : Colors.grey,
              fontSize: 10
                ),
          )
        ]),
      ),
    );
  }
}
