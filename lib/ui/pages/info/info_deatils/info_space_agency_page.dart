import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/space_agency/space_agency.dart';
import 'package:flutter_space_app/services/apirest/launch_library/space_agency_service.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/card_error_status_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/space_agency_widget/space_agency_list.dart';
import 'package:http/http.dart' as http;
import '/globals.Dart' as globals;

class InfoSpaceAgencyPage extends StatelessWidget{
  
  SpaceAgencyService spaceAgencyService = new SpaceAgencyService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Space Agencies'),
      ),
      body: FutureBuilder<List<SpaceAgency>>(
        future: spaceAgencyService.fetchGetSpaceAgencyList(http.Client(), 30),
        builder: (context, snapshot) {
        if (snapshot.hasError) {
          if(globals.hiveShowHtmlErrorsBool == true){
            return Center(
              child: CardErrorStatusSpApp(
                spaceAgencyService.obtainResponse().statusCode.toString(),
                spaceAgencyService.obtainResponse().reasonPhrase.toString()
              )
            );
          }else{
            late List<SpaceAgency> spaceAgencyList = [];
            return SpaceAgencyList(spaceAgencyL: spaceAgencyList, saveData: false);
          }
          
        } else if (snapshot.hasData) {
          return SpaceAgencyList(spaceAgencyL: snapshot.data!, saveData: true);
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
