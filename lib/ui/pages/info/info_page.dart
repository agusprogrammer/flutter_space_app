import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/space_station/space_station.dart';
import 'package:flutter_space_app/services/apirest/launch_library/space_station_service.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/card_error_status_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/navigation_button_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/space_station_widget/space_station_list.dart';
import 'package:http/http.dart' as http;
import '/globals.Dart' as globals;

class Info extends StatelessWidget {
  SpaceStationService spaceStationService = new SpaceStationService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SpaceStation>>(
      future: spaceStationService.fetchGetSpaceStationList(http.Client(), 30),
      builder: (context, snapshot) {
        if (snapshot.hasError) {

          if(globals.hiveShowHtmlErrorsBool == true){
            
            return ListView(children: [
              
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 5, top: 35, left: 10, right: 10),
                  child: Text('Space Stations', style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 25)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 1, top: 5, left: 10, right: 10),
                child: new NavigationButtonSpApp('Astronauts','astronaut')),
              Padding(
                padding: EdgeInsets.only(bottom: 1, top: 5, left: 10, right: 10),
                child: new NavigationButtonSpApp('Agencies','agency')),
              Center(
              child: CardErrorStatusSpApp(
                spaceStationService.obtainResponse().statusCode.toString(),
                spaceStationService.obtainResponse().reasonPhrase.toString()))
            ]);
            
          } else {

            late List<SpaceStation> spaceStationList = [];
            return SpaceStationList(spaceStationL: spaceStationList, saveData: false);

          }

        } else if (snapshot.hasData) {
          return SpaceStationList(spaceStationL: snapshot.data!, saveData: true);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
