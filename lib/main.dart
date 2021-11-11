import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/hive_database/launch_library/spacecraft/spacecraft_hive.dart';
import 'package:flutter_space_app/ui/pages/home/home_page.dart';
import 'package:flutter_space_app/ui/pages/info/info_page.dart';
import 'package:flutter_space_app/ui/pages/launch/launch_page.dart';
import 'package:flutter_space_app/ui/pages/spacecraft/launcher_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models/hive_database/launch_library/astronaut/astronaut_hive.dart';
import 'models/hive_database/launch_library/event/event_hive.dart';
import 'models/hive_database/launch_library/launch/launch_hive.dart';
import 'models/hive_database/launch_library/launcher/launcher_hive.dart';
import 'models/hive_database/launch_library/space_agency/space_agency_hive.dart';
import 'models/hive_database/launch_library/space_station/space_station_hive.dart';

void main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(LaunchHiveAdapter());
  Hive.registerAdapter(AstronautHiveAdapter());
  Hive.registerAdapter(EventHiveAdapter());
  Hive.registerAdapter(LauncherHiveAdapter());
  Hive.registerAdapter(SpaceAgencyHiveAdapter());
  Hive.registerAdapter(SpaceStationHiveAdapter());
  Hive.registerAdapter(SpacecraftHiveAdapter());

  await Hive.openBox<LaunchHive>('launch_hive_box');
  await Hive.openBox<AstronautHive>('astronaut_hive_box');
  await Hive.openBox<EventHive>('event_hive_box');
  await Hive.openBox<LauncherHive>('launcher_hive_box');
  await Hive.openBox<SpaceAgencyHive>('space_agency_hive_box');
  await Hive.openBox<SpaceStationHive>('space_station_hive_box');
  await Hive.openBox<SpacecraftHive>('spacecraft_hive_box');


  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 0, 204, 1.0),
      ),
      home: MainPage(),

    );
  }
}

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{

  final HomePage _home = new HomePage();
  final LaunchPage _launch = new LaunchPage();
  final LaunchersPage _spacecraft = new LaunchersPage();
  final Info _info = new Info();

  int _page = 0;
  Widget _showPage = new HomePage();

  Widget? _pageChooser(int page){
    switch (page) {
      case 0: 
        return _home;
        break;
      case 1: 
        return _launch;
        break;
      case 2: 
        return _spacecraft;
        break;
      case 3: 
        return _info;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _showPage,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromRGBO(0, 0, 204, 1.0),
        buttonBackgroundColor: Color.fromRGBO(0, 0, 204, 1.0),
        backgroundColor: Color.fromRGBO(220, 220, 220, 1.0),
        items: <Widget>[
          Padding(padding: new EdgeInsets.all(5.0), child: Icon(FontAwesomeIcons.newspaper, size: 20, color: Colors.white)),
          Padding(padding: new EdgeInsets.all(5.0), child: Icon(FontAwesomeIcons.rocket, size: 20, color: Colors.white)),
          Padding(padding: new EdgeInsets.all(5.0), child: Icon(FontAwesomeIcons.spaceShuttle, size: 20, color: Colors.white)),
          Padding(padding: new EdgeInsets.all(5.0), child: Icon(FontAwesomeIcons.satellite, size: 20, color: Colors.white))
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

   @override
  void dispose() {
    super.dispose();
    Hive.close(); // close all boxes
  }

}
