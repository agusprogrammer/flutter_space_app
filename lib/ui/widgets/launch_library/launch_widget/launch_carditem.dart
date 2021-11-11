import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launch/launch.dart';

class LaunchCardItem extends StatefulWidget{
  
  final Launch launch;

  LaunchCardItem(this.launch);

  @override
  _LaunchCardItemState createState() => _LaunchCardItemState(this.launch);

}

class _LaunchCardItemState extends State<LaunchCardItem> {
  
  final Launch launch;
  _LaunchCardItemState(this.launch);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
         padding: EdgeInsets.only(bottom: 15, top: 10, left: 15, right: 15),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5,
            shadowColor: Colors.black,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 5),
                  child: Text(this.launch.name, style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 22)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.launch.padLocationName, style: TextStyle(color: Colors.grey, fontSize: 20)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.launch.launchServProvName, style: TextStyle(color: Colors.grey, fontSize: 20)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.launch.launchServProvType, style: TextStyle(color: Colors.grey, fontSize: 20)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Last updated: ' + this.launch.lastUpdated, style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Date of launch: ' + this.launch.net, style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Rocket info ', style: TextStyle(color: Colors.black, fontSize: 20)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Name: ' + this.launch.rocketName, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Full name: ' + this.launch.rocketFullName, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Rocket family: ' + this.launch.rocketFamily, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Variant: ' + this.launch.rocketVariant, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Mission info ', style: TextStyle(color: Colors.black, fontSize: 20)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Mission name: ' + this.launch.missionName, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.launch.missionDescription, style: TextStyle(color: Colors.black, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Mission Type: ' + this.launch.missionType, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Mission launch designator: ' + this.launch.missionLaunchDesignator, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
                
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Orbit name: ' + this.launch.missionOrbitName, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Orbit abbrev: ' + this.launch.missionOrbitAbbrev, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Status info', style: TextStyle(color: Colors.black, fontSize: 20)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Status: ' + this.launch.statusName, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Abbrev: ' + this.launch.statusAbbrev, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.launch.statusDescription, style: TextStyle(color: Colors.black, fontSize: 15)),
                ),

              ]
            )
          )
          )
      )
    );
  }

}
