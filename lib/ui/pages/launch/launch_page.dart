import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launch/launch.dart';
import 'package:flutter_space_app/models/hive_database/launch_library/launch/launch_hive.dart';
import 'package:flutter_space_app/services/apirest/launch_library/launch_service.dart';
import 'package:flutter_space_app/services/hive_db_boxes/launch_hive_box.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/card_error_status_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/launch_widget/launch_list.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '/globals.Dart' as globals;

class LaunchPage extends StatefulWidget{
  
  @override
  _LaunchPageState createState() => _LaunchPageState();

}

class _LaunchPageState extends State<LaunchPage> {
  
  LaunchService launchService = new LaunchService();
  Future<List<Launch>>? futureListLaunches;
  bool firstResults = true;
  
  @override
  void initState() {
    super.initState();

    if(firstResults == true){

      fetchFirstResults();
      firstResults = false;
    }

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Launch>>(
      future: futureListLaunches,
      builder: (context, snapshot) {
        if (snapshot.hasError) {

          if(globals.hiveShowHtmlErrorsBool == true){
            return Center( child: CardErrorStatusSpApp(
              launchService.obtainResponse().statusCode.toString(),
              launchService.obtainResponse().reasonPhrase.toString()
            ));

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

  // obtain the first results
  fetchFirstResults() {
    futureListLaunches = launchService.fetchGetLaunchList(http.Client(), 30);
  }

}