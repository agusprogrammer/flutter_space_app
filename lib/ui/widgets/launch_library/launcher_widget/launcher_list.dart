
import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launcher/launcher.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/navigation_button_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/launcher_widget/launcher_carditem.dart';

class LauncherList extends StatefulWidget{
  
  const LauncherList({Key? key, required this.launcherL}) : super(key: key);

  final List<Launcher> launcherL;

  @override
  _LauncherList createState() => _LauncherList(launcherL);

}

class _LauncherList extends State<LauncherList>{
  
  final List<Launcher> launcherL;
  _LauncherList(this.launcherL);

  @override
  Widget build(BuildContext context) {
    
    /*
    return Container(
      decoration: new BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
      child: ListView.builder(
        itemCount: launcherL.length,
        itemBuilder: (context, index) {
          return new LauncherCardItem(launcherL[index]);
        },
      )
    );
    */

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5, top: 35, left: 10, right: 10),
              child: Text('Space Launchers', style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 25)),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 1, top: 5, left: 10, right: 10),
            child: new NavigationButtonSpApp('Spacecraft','spacecraft'))),
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          if (launcherL.length > index) {
            return new LauncherCardItem(launcherL[index]);
            
          }
        }))
      ]
    );


  }

}
