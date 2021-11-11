import 'dart:convert';
import 'package:flutter_space_app/models/apirest/launch_library/space_station/space_station.dart';

import 'package:http/http.dart';

class SpaceStationService {

  late Response _resp;
  late List<SpaceStation> spaceStationList;
  late bool errorResponseBool = true; 

  // Obtain a list of space station with get from url
  Future <List<SpaceStation>> fetchGetSpaceStationList(Client client, int _numResults) async {
    
    try{
      
      final response = await client.get(Uri.parse('https://ll.thespacedevs.com/2.2.0/spacestation/?limit=$_numResults'));
      _resp = response;
      errorResponseBool = false;

    }catch(e){
      
      Response responseCatch = new Response('', 404, reasonPhrase: 'Data not found, check your internet conection.');
      _resp = responseCatch;

    }

    if(errorResponseBool == false){
      if(_resp.statusCode >= 200 && _resp.statusCode < 300) {
        spaceStationList = parseSpaceStations(_resp);
      }
    }
    
    return spaceStationList;
  }

  // converts the Json of the response to a list
  List<SpaceStation> parseSpaceStations(Response response) {

    List<SpaceStation> _listSpaceStation = [];

    _resp = response;

    final json = "[" + response.body + "]";
    List<dynamic> data = jsonDecode(json);

    data.forEach((element) { 
      Map obj = element;
      List<dynamic> listObj = obj['results'];

      String nextResultsStr = obj['next'].toString();
      String previousResultsStr = obj['previous'].toString();
      
      if(nextResultsStr == null){ nextResultsStr = ''; }
      if(previousResultsStr == null){ previousResultsStr = ''; }

      listObj.forEach((elementResult) {

        Map statusMap = elementResult['status'];
        Map typeMap = elementResult['type'];  

        SpaceStation spaceStation = new SpaceStation(
          id: int.parse(elementResult['id'].toString()),
          url: elementResult['url'].toString(), 
          name: elementResult['name'].toString(),
          idStatus: int.parse(statusMap['id'].toString()),
          status: statusMap['name'].toString(),
          idType: int.parse(typeMap['id'].toString()),
          type: typeMap['name'].toString(),
          founded: elementResult['founded'].toString(),
          deorbited: elementResult['deorbited'].toString(),
          description: elementResult['description'].toString(),
          orbit: elementResult['orbit'].toString(),
          imageUrl: elementResult['image_url'].toString(),

          nextResults: nextResultsStr,
          previousResults: previousResultsStr
        );

        _listSpaceStation.add(spaceStation);

      });

    });

    return _listSpaceStation;
  }

  // method for obtain the response for show http errors on graphic interface
  Response obtainResponse() {
    return _resp;
  }

}

