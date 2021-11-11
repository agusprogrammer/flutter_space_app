import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/spacecraft/spacecraft.dart';

class SpacecraftCardItem extends StatelessWidget{
  
  late Spacecraft spacecraft;
  SpacecraftCardItem(this.spacecraft);

  @override
  Widget build(BuildContext context) {
    return  Container(
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
                      image: NetworkImage(this.spacecraft.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 5),
                  child: Text(this.spacecraft.name, style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 22)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.spacecraft.description, style: TextStyle(color: Colors.black, fontSize: 20)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.spacecraft.spcConfName, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Agency', style: TextStyle(color: Colors.black, fontSize: 20)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.spacecraft.agencyName, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Type: ' + this.spacecraft.agencyType, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Status', style: TextStyle(color: Colors.black, fontSize: 20)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Status: ' + this.spacecraft.status, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('in use: ' + this.spacecraft.inUse, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
                
                
              ]
            )
          ),
        )
      )
    );
  }

}

