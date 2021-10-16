import 'package:flutter/material.dart';
import 'package:flutter_space_app/ui/pages/home/home_details/home_article_page.dart';
import 'package:flutter_space_app/ui/pages/home/home_details/home_event_page.dart';
import 'package:flutter_space_app/ui/pages/home/home_details/home_report_page.dart';
import 'package:flutter_space_app/ui/pages/info/info_deatils/info_astronaut_page.dart';
import 'package:flutter_space_app/ui/pages/info/info_deatils/info_space_agency_page.dart';
import 'package:flutter_space_app/ui/pages/spacecraft/spacecraft_details/spacecraft_details.dart';

class NavigationButtonSpApp extends StatefulWidget {

  late String text = '';
  late String routeNavigationStr = '';

  NavigationButtonSpApp(this.text, this.routeNavigationStr);

  @override
  State<NavigationButtonSpApp> createState() => _NavigationButtonSpAppState(this.text, this.routeNavigationStr);
}

class _NavigationButtonSpAppState extends State<NavigationButtonSpApp> {
  
   late String text = '';
   late String routeNavigationStr = '';

   _NavigationButtonSpAppState(this.text, this.routeNavigationStr);
  
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 15, color: Colors.white),
        primary: Color.fromRGBO(0, 0, 204, 1.0),
        elevation: 7,
        shadowColor: Colors.black,
        minimumSize: Size(double.infinity, 30),
        padding: EdgeInsets.all(10.0));

    return Center(
      child: ElevatedButton(
        style: style,
        onPressed: () {
          // Navigator.push(context, new MaterialPageRoute(builder: (context) => new Page()));
          // Navigator.pushNamed(context, this.routeNavigationStr);

          switch(this.routeNavigationStr) {
            case 'reports': { 
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomeReportPage()));
            } 
            break;
            case 'articles': { 
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomeArticlePage())); 
            } 
            break;
            case 'events': { 
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomeEventPage())); 
            } 
            break;
            case 'spacecraft': {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new SpacecraftDeatilsPage())); 
            }
            break;
            case 'astronaut': {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new InfoAstronautPage())); 
            }
            break;
            case 'agency': {
              Navigator.push(context, new MaterialPageRoute(builder: (context) => new InfoSpaceAgencyPage())); 
            }
            break;
          }

        },
        child: Text(text),
      ),
    );
  }

  // hacer metodo para navegar


}


