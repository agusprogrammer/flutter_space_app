import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launch/launch.dart';
import 'package:flutter_space_app/services/apirest/launch_library/launch_service.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/card_error_status_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/launch_widget/launch_list.dart';
import 'package:http/http.dart' as http;

import '/globals.Dart' as globals;

class LaunchPage extends StatefulWidget{
  
  @override
  _LaunchPageState createState() => _LaunchPageState();

}

class _LaunchPageState extends State<LaunchPage> {
  
  LaunchService launchService = new LaunchService();
  Future<List<Launch>>? futureListLaunches;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Launch>>(
      future: launchService.fetchGetLaunchList(http.Client(), 30),
      builder: (context, snapshot) {
        if (snapshot.hasError) {

          if(globals.hiveShowHtmlErrorsBool == true){

            return ListView(children: [
              Center(
                child: Padding(
                padding: EdgeInsets.only(bottom: 5, top: 35, left: 10, right: 10),
                child: Text('Launches', style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 25)))
              ),
              Center(child:
                CardErrorStatusSpApp(
                launchService.obtainResponse().statusCode.toString(),
                launchService.obtainResponse().reasonPhrase.toString())
              )
            ]);
            
          } else {
            late List<Launch> launchL = [];
            return LaunchList(launchL: launchL, saveData: false);
          }
          
        } else if (snapshot.hasData) {
          return LaunchList(launchL: snapshot.data!, saveData: true);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });
    
  }

}