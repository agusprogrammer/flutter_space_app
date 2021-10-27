
import 'dart:convert';
import 'package:flutter_space_app/models/apirest/launch_library/launcher/launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class LauncherService {
  
  late Response _resp;
  late List<Launcher> launcherList;
  late bool errorResponseBool = true; 

  Future <List<Launcher>> fetchLauncherList(Client client, int _numResults) async {
    
    try{ 
      
      final response = await client.get(Uri.parse('https://ll.thespacedevs.com/2.2.0/launcher/?limit=$_numResults'));
      _resp = response;
      errorResponseBool = false;

    }catch(e){

      Response responseCatch = new Response('', 404, reasonPhrase: 'Data not found, check your internet conection.');
      _resp = responseCatch;
      // launcherList = parseLauncherList(_resp);
      // launcherList = null;

      // return compute(parseLauncherList, response);

    }
    
    if(errorResponseBool == false){
      if(_resp.statusCode >= 200 && _resp.statusCode < 300) {
        launcherList = parseLauncherList(_resp);
      }
    }

    return launcherList;
    
  }

  List<Launcher> parseLauncherList(Response response){
    List<Launcher> _launcherList = [];

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

        Map launchConf = elementResult['launcher_config'];

        Launcher launcher = new Launcher(
          id: int.parse(elementResult['id'].toString()), 
          url: elementResult['url'].toString(), 
          flightProven: elementResult['flight_proven'].toString(), 
          serialNumber: elementResult['serial_number'].toString(), 
          status: elementResult['status'].toString(), 
          details: elementResult['details'].toString(), 
          
          launchConfId: int.parse(launchConf['id'].toString()), 
          launchConfUrl: launchConf['url'].toString(), 
          launchConfName: launchConf['name'].toString(), 
          launchConfFamily: launchConf['family'].toString(), 
          launchConfFullName: launchConf['full_name'].toString(), 
          launchConfVariant: launchConf['variant'].toString(),

          imageUrl: elementResult['image_url'].toString(), 
          flights: elementResult['flights'].toString(), 
          lastLaunchDate: elementResult['last_launch_date'].toString(), 
          firstLaunchDate: elementResult['first_launch_date'].toString(),

          nextResults: nextResultsStr,
          previousResults: previousResultsStr
        );

        _launcherList.add(launcher);

      });

    });

    return _launcherList;
  }

  Response obtainResponse() {
    return _resp;
  }

}