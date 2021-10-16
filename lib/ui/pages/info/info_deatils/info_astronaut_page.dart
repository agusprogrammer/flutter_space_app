import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/astronaut/astronaut.dart';
import 'package:flutter_space_app/services/apirest/launch_library/astronaut_service.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/card_error_status_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/astronaut_widget/astronaut_list.dart';
import 'package:http/http.dart' as http;

class InfoAstronautPage extends StatelessWidget {
  
  AstronautService astronautService = new AstronautService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('Astronauts'),
      ),
      body: FutureBuilder<List<Astronaut>>(
        future: astronautService.fetchGetAstronautList(http.Client(), 2),
        builder: (context, snapshot){
        if (snapshot.hasError) {
          return Center(
            child: CardErrorStatusSpApp(
              astronautService.obtainResponse().statusCode.toString(),
              astronautService.obtainResponse().reasonPhrase.toString()
            )
          );
        } else if (snapshot.hasData) {
          return AstronautList(astronautL: snapshot.data!);
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