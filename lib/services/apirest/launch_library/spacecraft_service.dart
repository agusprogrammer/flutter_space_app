
import 'dart:convert';
import 'package:flutter_space_app/models/apirest/launch_library/spacecraft/spacecraft.dart';
import 'package:http/http.dart';

class SpacecraftService {
  
  late Response _resp;
  late List<Spacecraft> spacecraftList;
  late bool errorResponseBool = true; 

  // Obtain a list of spacecraft with get from url
  Future <List<Spacecraft>> fetchGetSpacecraftList(Client client, int _numResults) async {
    
    try{
      
      final response = await client.get(Uri.parse('https://ll.thespacedevs.com/2.2.0/spacecraft/?limit=$_numResults'));
      _resp = response;
      errorResponseBool = false;

    }catch(e){

      Response responseCatch = new Response('', 404, reasonPhrase: 'Data not found, check your internet conection.');
      _resp = responseCatch;

    }

    if(errorResponseBool == false){
      spacecraftList = parseSpacecraftList(_resp);
    }
    
    return spacecraftList;
    
  } 

  // converts the Json of the response to a list
  List<Spacecraft> parseSpacecraftList(Response response){
    List<Spacecraft> _listSpaceCraft = [];

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
        
        Map spacecraftConfigMap = elementResult['spacecraft_config'];
        Map agencyMap = spacecraftConfigMap['agency'];
        
        Map spacecrConfMapType = spacecraftConfigMap['type'];

        Spacecraft spacecraft = new Spacecraft(
          id: int.parse(elementResult['id'].toString()),
          url: elementResult['url'].toString(),
          name: elementResult['name'].toString(),
          status: statusMap['name'].toString(),
          serialNumber: elementResult['serial_number'].toString(),
          description: elementResult['description'].toString(),
          
          spcConfName: spacecraftConfigMap['name'].toString(), 
          
          spcConfType: spacecrConfMapType['name'].toString(), 
          
          agencyName: agencyMap['name'].toString(), 
          agencyType: agencyMap['type'].toString(), 
          
          imageUrl: spacecraftConfigMap['image_url'].toString(), 
          inUse: spacecraftConfigMap['in_use'].toString(), 

          nextResults: nextResultsStr,
          previousResults: previousResultsStr
          
        ); 

        _listSpaceCraft.add(spacecraft);

      });

    });

    return _listSpaceCraft;
  }

  // method for obtain the response for show http errors on graphic interface
  Response obtainResponse() {
    return _resp;
  }

}
