
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launch/launch.dart';
import 'package:http/http.dart';

class LaunchService {
  
  late Response _resp;
  late List<Launch> totalListLaunch;
  late bool errorResponseBool = true;

  Future <List<Launch>> fetchGetLaunchList(Client client, int _numResults) async {
    
    try{
      
      final response = await client.get(Uri.parse('https://ll.thespacedevs.com/2.2.0/launch/?limit=$_numResults&include_suborbital=true&related=true'));
      _resp = response;
      errorResponseBool = false;

    }catch(e){
      
      Response responseCatch = new Response('', 404, reasonPhrase: 'Data not found, check your internet conection.');
      _resp = responseCatch;

    }

    if(errorResponseBool == false){
      if(_resp.statusCode >= 200 && _resp.statusCode < 300) {
        totalListLaunch = parseLaunchList(_resp);
      }
    }
    
    return totalListLaunch;
    // return compute(parseLaunchList, response);
  }

  /* metodo sin usar --
  Future <List<Launch>> fetchGetLaunchListNextResults(Client client, String _nextResults) async {
    
    late List<Launch> _listLaunch = [];
    Response _response = new Response('', 404);

    try{

      _response = await client.get(Uri.parse(_nextResults));
      errorResponseBool = false;

    }catch(e){
      errorResponseBool = true;
    }

    if(errorResponseBool == false){
      
      if(_response.statusCode >= 200 && _response.statusCode < 300) {
        // _listLaunch = parseLaunchList(_response);
        _listLaunch.addAll(parseLaunchList(_response));
        totalListLaunch.addAll(_listLaunch);
      }

      return totalListLaunch;
    
    } else {
      return _listLaunch;
    }

  }
  */

  List<Launch> parseLaunchList(Response response){
    List<Launch> _listLaunch = [];
    _listLaunch.clear();

    _resp = response;

    final json = "[" + response.body + "]";
    List<dynamic> data = jsonDecode(json);

    data.forEach((element) { 

      Map obj = element;
      List<dynamic> listObj = obj['results'];

      String nextResultsStr = obj['next'].toString();
        String previousResultsStr = obj['previous'].toString();

        if(nextResultsStr == null){ nextResultsStr = ''; }

        if(previousResultsStr == null){ previousResultsStr = ''; 
      }

      listObj.forEach((elementResult) { 

        Map statusMap = elementResult['status'];
        Map providerMap = elementResult['launch_service_provider'];

        Map rocketMap = elementResult['rocket'];
        Map rocketConfMap = rocketMap['configuration'];

        Map missionMap = elementResult['mission'];
        Map orbitMissionMap = missionMap['orbit'];

        Map padMap = elementResult['pad'];
        Map locationPadMap = padMap['location'];

        Launch launch = new Launch(
          id: elementResult['id'].toString(), 
          url: elementResult['url'].toString(), 
          slug: elementResult['slug'].toString(), 
          name: elementResult['name'].toString(), 

          statusId: int.parse(statusMap['id'].toString()), 
          statusName: statusMap['name'].toString(), 
          statusAbbrev: statusMap['abbrev'].toString(), 
          statusDescription: statusMap['description'].toString(), 

          lastUpdated: elementResult['last_updated'].toString(), 
          net: elementResult['net'].toString(), 
          windowEnd: elementResult['window_end'].toString(), 
          windowStart: elementResult['window_start'].toString(), 
          // probability: int.parse(elementResult['probability'].toString()), 
          holdreason: elementResult['holdreason'].toString(), 
          failreason: elementResult['failreason'].toString(),

          launchServProvId: int.parse(providerMap['id'].toString()), 
          launchServProvUrl: providerMap['url'].toString(), 
          launchServProvName: providerMap['name'].toString(), 
          launchServProvType: providerMap['type'].toString(), 

          rocketName: rocketConfMap['name'].toString(), 
          rocketFamily: rocketConfMap['family'].toString(), 
          rocketFullName: rocketConfMap['full_name'].toString(), 
          rocketVariant: rocketConfMap['variant'].toString(), 

          missionName: missionMap['name'].toString(), 
          missionDescription: missionMap['description'].toString(), 
          missionLaunchDesignator: missionMap['launch_designator'].toString(), 
          missionType: missionMap['type'].toString(),

          missionOrbitName: orbitMissionMap['name'].toString(),
          missionOrbitAbbrev: orbitMissionMap['abbrev'].toString(), 

          padLocationName: locationPadMap['name'].toString(), 

          image: elementResult['image'].toString(), 
          infographic: elementResult['infographic'].toString(),

          nextResults: nextResultsStr,
          previousResults: previousResultsStr
        );
        
        _listLaunch.add(launch);

      });

    });

    return _listLaunch;
  }

  Response obtainResponse() {
    return _resp;
  }

}
