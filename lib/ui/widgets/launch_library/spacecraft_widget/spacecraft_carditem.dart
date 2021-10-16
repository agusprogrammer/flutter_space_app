import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/spacecraft/spacecraft.dart';

class SpacecraftCardItem extends StatefulWidget{
  
  final Spacecraft spacecraft;
  SpacecraftCardItem(this.spacecraft);

  
  @override
  _SpacecraftCardItemState createState() => _SpacecraftCardItemState(this.spacecraft);

}

class _SpacecraftCardItemState extends State<SpacecraftCardItem>{
  
  late Spacecraft spacecraft;
  _SpacecraftCardItemState(this.spacecraft);

  @override
  Widget build(BuildContext context) {
    return 
    Padding(
      padding: EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        shadowColor: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Ink(
                  height: 115,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0), bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                    image: DecorationImage(
                      image: NetworkImage(this.spacecraft.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 0, top: 1),
                  child: Center(child: 
                    Text(spacecraft.name, style: TextStyle(color: Colors.black, fontSize: 10)),
                  )
                ),

              ]
            )
              
          )
        )
      );
      

    /*
    Padding(
      padding: EdgeInsets.all(5.0),
      child: Column(
        children: [],
      )
      
    );
    */

    /* 
    Padding(
      padding: EdgeInsets.all(5.0),
      child: GridTile(
      child: Image.network(this.spacecraft.imageUrl, fit:BoxFit.fill), // width: 100, height: 100
      footer: Container(
        decoration: new BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
        child: Center(child: Text(this.spacecraft.name, style: TextStyle(color: Colors.black, fontSize: 15)),),
      ),
      ),
      
    );

    */


  }

}
