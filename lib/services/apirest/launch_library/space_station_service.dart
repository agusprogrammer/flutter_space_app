import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launch_library_resp.dart';
import 'package:flutter_space_app/models/apirest/launch_library/space_station/space_st_active_expedition.dart';
import 'package:flutter_space_app/models/apirest/launch_library/space_station/space_st_owner.dart';
import 'package:flutter_space_app/models/apirest/launch_library/space_station/space_station.dart';

import 'package:http/http.dart';

class SpaceStationService {
  
  // final int _numResults = 10;

  Future <List<SpaceStation>> fetchGetSpaceStationList(Client client, int _numResults) async {
    final response = await client.get(Uri.parse('https://ll.thespacedevs.com/2.2.0/spacestation/?limit=$_numResults'));
    return compute(parseSpaceStations, response);
  }

  /*
  Future <List<LaunchLibraryResp>> fetchGetSpaceStationList(Client client) async {
    final response = await client.get(Uri.parse('https://ll.thespacedevs.com/2.2.0/spacestation/?limit=$_numResults'));
    return compute(parseLaunchLibrary, response.body);
  }
  */

  List<SpaceStation> parseSpaceStations(Response response) {
    // final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    // var returnData;
    // return parsed.map<LaunchLibraryResp>((json) => SpaceStation.fromJson(json)).toList();
    // print(returnData['results'].toString());
    // return returnData['results'];

    List<SpaceStation> _listSpaceStation = [];

    final json = "[" + response.body + "]";
    List<dynamic> data = jsonDecode(json);

    data.forEach((element) { 
      Map obj = element;
      // print(obj['next'].toString());
      List<dynamic> listObj = obj['results'];

      listObj.forEach((elementResult) { 
        // print(elementResult['name'].toString());

        Map statusMap = elementResult['status'];
        Map typeMap = elementResult['type'];

        List<dynamic> listDynOwners = elementResult['owners'];
        List<SpaceStOwner> listOwners = [];

        listDynOwners.forEach((elementOwner) { 

          SpaceStOwner spaceStOwner = new SpaceStOwner(
            id: int.parse(elementOwner['id']), 
            url: elementOwner['url'].toString(), 
            name: elementOwner['name'].toString(), 
            abbrev: elementOwner['abbrev'].toString()
          );

          listOwners.add(spaceStOwner);

        });

        List<dynamic> listDynExpd = elementResult['owners'];
        List<SpaceStActiveExpedition> listExped = [];

        listDynExpd.forEach((elementExpd) { 

          SpaceStActiveExpedition spaceStActExped = new SpaceStActiveExpedition(
            id: int.parse(elementExpd['id']),
            url: elementExpd['url'].toString(),
            name: elementExpd['name'].toString(),
            start: elementExpd['start'].toString(),
            end: elementExpd['end'].toString()
          );

          listExped.add(spaceStActExped);

        });        

        SpaceStation spaceStation = new SpaceStation(
          id: int.parse(elementResult['id']),
          url: elementResult['url'].toString(), 
          name: elementResult['name'].toString(),
          idStatus: int.parse(statusMap['id']),
          status: statusMap['name'].toString(),
          idType: int.parse(typeMap['id']),
          type: typeMap['name'].toString(),
          founded: elementResult['founded'].toString(),
          deorbited: elementResult['deorbited'].toString(),
          description: elementResult['description'].toString(),
          orbit: elementResult['orbit'].toString(),
          owners: listOwners,
          expeditions: listExped,
          imageUrl: elementResult['image_url'].toString()
        );

        _listSpaceStation.add(spaceStation);

      });

    });

    return _listSpaceStation;
  }

  
  


}

