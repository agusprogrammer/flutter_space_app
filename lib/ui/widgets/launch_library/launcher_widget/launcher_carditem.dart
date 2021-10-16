import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launcher/launcher.dart';

class LauncherCardItem extends StatefulWidget{
  
  final Launcher launcher;
  LauncherCardItem(this.launcher);

  @override
  _LauncherCardItemState createState() => _LauncherCardItemState(this.launcher);
}

class _LauncherCardItemState extends State<LauncherCardItem>{
  
  late Launcher launcher;
  _LauncherCardItemState(this.launcher);

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
                
                Ink(
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                    image: DecorationImage(
                      image: NetworkImage(this.launcher.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(this.launcher.launchConfName, style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 22)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Full name: ' + this.launcher.launchConfFullName, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Family: ' + this.launcher.launchConfFamily, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Variant: ' + this.launcher.launchConfVariant, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(this.launcher.details, style: TextStyle(color: Colors.black, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.launcher.status, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('First launch: ' + this.launcher.firstLaunchDate, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Last launch: ' + this.launcher.lastLaunchDate, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

              ]
            )
          )
        )
      )
    );
  }

}

