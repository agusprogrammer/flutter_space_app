import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/astronaut/astronaut.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/astronaut_widget/astronaut_carditem.dart';

class AstronautList extends StatefulWidget{
  
  const AstronautList({Key? key, required this.astronautL}) : super(key: key);

  final List<Astronaut> astronautL;

  @override
  _AstronautList createState() => _AstronautList(astronautL);

}

class _AstronautList extends State<AstronautList>{
  
  final List<Astronaut> astronautL;
  _AstronautList(this.astronautL);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
      child: ListView.builder(
        itemCount: astronautL.length,
        itemBuilder: (context, index) {
          return new AstronautCardItem(astronautL[index]);
        },
      ),
    );
  }

}

