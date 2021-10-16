import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launch_library_resp.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launch_library_resp.dart';
import 'package:flutter_space_app/models/apirest/launch_library/space_station/space_station.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/navigation_button_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/space_station_widget/space_station_carditem.dart';

class SpaceStationList extends StatelessWidget {
  const SpaceStationList({Key? key, required this.spaceStationL}) : super(key: key);

  final List<SpaceStation> spaceStationL;
  // List<SpaceStation> spaceStationsL;

  @override
  Widget build(BuildContext context) {
    
    /*
    return Container(
      decoration: new BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
      child: ListView.builder(
        itemCount: spaceStationL.length,
        itemBuilder: (context, index) {
          return new SpaceStationCardItem(spaceStationL[index]);
        },
      ));
      */

      return CustomScrollView(
         slivers: [
          SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5, top: 35, left: 10, right: 10),
              child: Text('Space Stations', style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 25)),
            ),
          ),
          ),
          SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 1, top: 5, left: 10, right: 10),
            child: new NavigationButtonSpApp('Astronauts','astronaut'))),
          SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 1, top: 5, left: 10, right: 10),
            child: new NavigationButtonSpApp('Agencies','agency'))),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            if (spaceStationL.length > index) {
              return new SpaceStationCardItem(spaceStationL[index]);
            }
          }))
         ]
      );

  }

}