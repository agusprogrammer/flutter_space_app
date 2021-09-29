import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launch_library_resp.dart';
import 'package:flutter_space_app/models/apirest/launch_library/space_station/space_station.dart';
import 'package:flutter_space_app/services/apirest/launch_library/space_station_service.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/space_station_widget/space_station_list.dart';
import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

class Info extends StatelessWidget{
  
  SpaceStationService _spaceStationService = new SpaceStationService();
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SpaceStation>>(
      future: _spaceStationService.fetchGetSpaceStationList(http.Client(), 2),
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