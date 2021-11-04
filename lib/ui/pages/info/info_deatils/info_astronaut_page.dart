import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/astronaut/astronaut.dart';
import 'package:flutter_space_app/services/apirest/launch_library/astronaut_service.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/card_error_status_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/astronaut_widget/astronaut_list.dart';
import 'package:http/http.dart' as http;
import '/globals.Dart' as globals;

class InfoAstronautPage extends StatelessWidget {
  
  AstronautService astronautService = new AstronautService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Astronauts'),
      ),
      body: FutureBuilder<List<Astronaut>>(
        future: astronautService.fetchGetAstronautList(http.Client(), 30),
        builder: (context, snapshot){
        if (snapshot.hasError) {

          if(globals.hiveShowHtmlErrorsBool == true){
          return Center(
            child: CardErrorStatusSpApp(
              astronautService.obtainResponse().statusCode.toString(),
              astronautService.obtainResponse().reasonPhrase.toString()
            )
          );
          }else{
            late List<Astronaut> astronautList = [];
            return AstronautList(astronautL: astronautList, saveData: false);
          }

        } else if (snapshot.hasData) {
          return AstronautList(astronautL: snapshot.data!, saveData: true);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        },
      ),
    );
  }
  
}