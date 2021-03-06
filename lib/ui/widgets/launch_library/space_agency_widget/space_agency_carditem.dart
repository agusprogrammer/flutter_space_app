

import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/space_agency/space_agency.dart';

class SpaceAgencyCardItem extends StatelessWidget {

  late SpaceAgency spaceAgencyItem;
  SpaceAgencyCardItem(this.spaceAgencyItem);

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
                  child: Text(this.spaceAgencyItem.name, style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 22)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.spaceAgencyItem.description, style: TextStyle(color: Colors.black, fontSize: 20)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Founding: ' + this.spaceAgencyItem.foundingYear, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
                
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Type: ' + this.spaceAgencyItem.type, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Abbrev: ' + this.spaceAgencyItem.abbrev, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Country code: ' + this.spaceAgencyItem.countryCode, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Launchers: ' + this.spaceAgencyItem.launchers, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Spacecraft: ' + this.spaceAgencyItem.spacecraft, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
                
              ]
            )
          )
        )
      )
    );
  }
}

