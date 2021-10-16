
import 'package:flutter/foundation.dart';
import 'package:flutter_space_app/models/apirest/launch_library/astronaut/astronaut.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AstronautService {
  
  late Response _resp;
  late List<Astronaut> listAstronaut;
  late bool errorResponseBool = true;

  Future <List<Astronaut>> fetchGetAstronautList(Client client, int _numResults) async {
    
    try{

      final response = await client.get(Uri.parse('https://ll.thespacedevs.com/2.2.0/astronaut/?limit=$_numResults'));
      _resp = response;
      errorResponseBool = false;

    }catch(e){

      Response responseCatch = new Response('', 404, reasonPhrase: 'Data not found, check your internet conection.');
      _resp = responseCatch;

    }

    if(errorResponseBool == false){
      if(_resp.statusCode >= 200 && _resp.statusCode < 300) {
        listAstronaut = parseAstronautList(_resp);
      }
    }
    
    return listAstronaut;
    // return compute(parseAstronautList, response);
  }

  List<Astronaut> parseAstronautList(Response response){
    List<Astronaut> _listAstronaut = [];

    _resp = response;

    final json = "[" + response.body + "]";
    List<dynamic> data = jsonDecode(json);

    data.forEach((element) { 

      Map obj = element;
      List<dynamic> listObj = obj['results'];

      listObj.forEach((elementResult) { 

        Map statusMap = elementResult['status'];
        Map typeMap = elementResult['type'];
        Map agencyMap = elementResult['agency'];

        Astronaut astronaut = new Astronaut(
          id: int.parse(elementResult['id'].toString()), 
          url: elementResult['url'].toString(), 
          name: elementResult['name'].toString(), 
          agency: agencyMap['name'].toString(), 
          bio: elementResult['bio'].toString(), 
          dateOfBirth: elementResult['date_of_birth'].toString(), 
          dateOfDeath: elementResult['date_of_death'].toString(), 
          firstFlight: elementResult['first_flight'].toString(), 
          lastFlight: elementResult['last_flight'].toString(),
          nationality: elementResult['nationality'].toString(), 
          profileImage: elementResult['profile_image'].toString(), 
          profileImageThumbnail: elementResult['profile_image_thumbnail'].toString(), 
          status: statusMap['name'].toString(), 
          type: typeMap['type'].toString(),
          wiki: elementResult['wiki'].toString(),
        );

        _listAstronaut.add(astronaut);

      });

    });

    return _listAstronaut;
  }

  Response obtainResponse() {
    return _resp;
  }

}
