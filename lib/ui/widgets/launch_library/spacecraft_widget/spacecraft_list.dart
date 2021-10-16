
import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/spacecraft/spacecraft.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/spacecraft_widget/spacecraft_carditem.dart';

class SpacecraftList extends StatefulWidget{

  const SpacecraftList({Key? key, required this.spacecraftL}) : super(key: key);

  final List<Spacecraft> spacecraftL;

  @override
  _SpacecraftListState createState() => _SpacecraftListState(spacecraftL);

}

class _SpacecraftListState extends State<SpacecraftList>{
  
  final List<Spacecraft> spacecraftL;
  _SpacecraftListState(this.spacecraftL);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: new BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 1),
        itemCount: spacecraftL.length,
        itemBuilder: (context, index) {
          return new SpacecraftCardItem(spacecraftL[index]);
        }, 
      )
    );

  }

}
