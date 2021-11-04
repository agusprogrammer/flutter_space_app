import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/spacecraft/spacecraft.dart';
import 'package:flutter_space_app/services/apirest/launch_library/spacecraft_service.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/card_error_status_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/spacecraft_widget/spacecraft_list.dart';
import 'package:http/http.dart' as http;
import '/globals.Dart' as globals;

class SpacecraftPage extends StatelessWidget {
  
  SpacecraftService spacecraftService = new SpacecraftService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spacecraft'),
      ),
      body: FutureBuilder<List<Spacecraft>>(
        future: spacecraftService.fetchGetSpacecraftList(http.Client(), 30),
        builder: (context, snapshot) {
        if (snapshot.hasError) {

          if(globals.hiveShowHtmlErrorsBool == true){
            return Center(
            child: CardErrorStatusSpApp(
              spacecraftService.obtainResponse().statusCode.toString(),
              spacecraftService.obtainResponse().reasonPhrase.toString()
            )
            );
          }else{
            late List<Spacecraft> spacecraftList = [];
            return SpacecraftList(spacecraftL: spacecraftList, saveData: false);
          }

        } else if (snapshot.hasData) {
          return SpacecraftList(spacecraftL: snapshot.data!, saveData: true);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },)
    );
  }



}