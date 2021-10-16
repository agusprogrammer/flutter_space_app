import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launch_library_resp.dart';
import 'package:flutter_space_app/models/apirest/launch_library/space_agency/space_agency.dart';
import 'package:flutter_space_app/models/apirest/launch_library/space_station/space_station.dart';
import 'package:flutter_space_app/services/apirest/launch_library/space_agency_service.dart';
import 'package:flutter_space_app/services/apirest/launch_library/space_station_service.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/card_error_status_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/navigation_button_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/space_agency_widget/space_agency_list.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/space_station_widget/space_station_list.dart';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

class Info extends StatelessWidget {
  SpaceStationService spaceStationService = new SpaceStationService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SpaceStation>>(
      future: spaceStationService.fetchGetSpaceStationList(http.Client(), 4),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return CustomScrollView(slivers: [
            SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: 5, top: 35, left: 10, right: 10),
                  child: Text('Space Stations',
                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 25)),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
                    padding:
                        EdgeInsets.only(bottom: 1, top: 5, left: 10, right: 10),
                    child:
                        new NavigationButtonSpApp('Astronauts', 'astronaut'))),
            SliverToBoxAdapter(
                child: Padding(
                    padding:
                        EdgeInsets.only(bottom: 1, top: 5, left: 10, right: 10),
                    child: new NavigationButtonSpApp('Agencies', 'agency'))),
            SliverToBoxAdapter(
              child: Center(
                  child: CardErrorStatusSpApp(
                      spaceStationService
                          .obtainResponse()
                          .statusCode
                          .toString(),
                      spaceStationService
                          .obtainResponse()
                          .reasonPhrase
                          .toString())),
            )
          ]);
        } else if (snapshot.hasData) {
          return SpaceStationList(spaceStationL: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  /*
  SpaceStationService _spaceStationService = new SpaceStationService();
  
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SpaceStation>>(
      future: _spaceStationService.fetchGetSpaceStationList(http.Client(), 4),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return SpaceStationList(spaceStationL: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      },
    );
  }
  */

  /*
  SpaceAgencyService _spaceAgencyService = new SpaceAgencyService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SpaceAgency>>(
      future: _spaceAgencyService.fetchGetSpaceAgencyList(http.Client(), 15),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return SpaceAgencyList(spaceAgencyL: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      }
    );
  }
  */

}

/*
class _InfoState extends State<Info> {
  
  
  // late List<String> _names = [];
  // final List<String> _names = [];

  /*
  void getJsonData() async {

    Response response = await get(Uri.parse('https://ll.thespacedevs.com/2.2.0/spacestation/?limit=5')); 
    // print(response.body);
    final json = "[" + response.body + "]";
    List<dynamic> data = jsonDecode(json);
    // data['next'].toString();
    // print(data.toString());


    data.forEach((element) { 
      Map obj = element;
      // print(obj['next'].toString());
      List<dynamic> listObj = obj['results'];

      listObj.forEach((elementResult) { 
        print(elementResult['name'].toString());
        _names.add(elementResult['name'].toString());
      });

    });


    // Map dataMap = data as Map;
    // print(dataMap['next']);
  }
  */

  @override 
  void initState() {
    // TODO: implement initState
    super.initState();
    // getJsonData();
  }

}
*/