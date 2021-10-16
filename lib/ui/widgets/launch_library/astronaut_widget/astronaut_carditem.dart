import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/astronaut/astronaut.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/navigation_url_button_sp_app.dart';

class AstronautCardItem extends StatefulWidget{
  
  final Astronaut astronaut;
  AstronautCardItem(this.astronaut);

  @override
  _AstronautCardItemState createState() => _AstronautCardItemState(this.astronaut);

}

class _AstronautCardItemState extends State<AstronautCardItem>{
  
  late Astronaut astronaut;

  _AstronautCardItemState(this.astronaut);

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
                      image: NetworkImage(this.astronaut.profileImageThumbnail),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(this.astronaut.name, style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 22)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('type: ' + this.astronaut.type, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Agency: ' + this.astronaut.agency, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Nationality: ' + this.astronaut.nationality, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Status: ' + this.astronaut.status, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Birth: ' + this.astronaut.dateOfBirth, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Death: ' + this.astronaut.dateOfDeath, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('First flight: ' + this.astronaut.firstFlight, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Last flight: ' + this.astronaut.lastFlight, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(this.astronaut.bio, style: TextStyle(color: Colors.black, fontSize: 20)),
                ),

                NavigationUrlButton('Wiki', this.astronaut.wiki)

              ]
            )
          )
        )
      )
    );
  }

}

