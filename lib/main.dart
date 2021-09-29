import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_space_app/services/apirest/spaceflight_news/article_service.dart';
import 'package:flutter_space_app/ui/pages/home/home.dart';
import 'package:flutter_space_app/ui/pages/info/info.dart';
import 'package:flutter_space_app/ui/pages/launch/launch.dart';
import 'package:flutter_space_app/ui/pages/spacecraft/spacecraft.dart';
import 'package:get_it/get_it.dart';


void main() {
  setupLocatorServices();
  runApp(MyApp());
}

void setupLocatorServices() {
  GetIt.instance.registerLazySingleton(() => ArticleService());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // title: 'Flutter Demo',
      // theme: ThemeData(primarySwatch: Colors.indigo),

      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  // MyHomePage({Key? key, required this.title}) : super(key: key);
  // final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{

  final Home _home = new Home();
  final Launch _launch = new Launch();
  final Spacecraft _spacecraft = new Spacecraft();
  final Info _info = new Info();

  int _page = 0;
  Widget _showPage = new Home();

  Widget? _pageChooser(int page){
    switch (page) {
      case 0: return _home;
      break;
      case 1: return _launch;
      break;
      case 2: return _spacecraft;
      break;
      case 3: return _info;
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text(widget.title),
      ), */
      body: Center(
        child: _showPage,

        /*
        child: Column(
           children: <Widget>[],
        ),*/

      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromRGBO(0, 0, 204, 1.0),
        buttonBackgroundColor: Color.fromRGBO(0, 0, 204, 1.0),
        backgroundColor: Color.fromRGBO(220, 220, 220, 1.0),
        items: <Widget>[
          Icon(Icons.article, size: 30, color: Colors.white),
          Icon(Icons.history, size: 30, color: Colors.white),
          Icon(Icons.flight, size: 30, color: Colors.white),
          Icon(Icons.menu_book, size: 30, color: Colors.white)
        ],
        onTap: (index) {
          setState(() {
            _page = index;
            _showPage = _pageChooser(_page)!;

          });
        },
        letIndexChange: (index) => true,

      ),

    );
  }
}
