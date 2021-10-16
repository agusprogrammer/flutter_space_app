
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_space_app/models/apirest/launch_library/space_agency/space_agency.dart';
import 'package:http/http.dart';

class  SpaceAgencyService {
  
  late Response _resp;
  late List<SpaceAgency> listSpaceAgency;
  late bool errorResponseBool = true;

  Future<List<SpaceAgency>> fetchGetSpaceAgencyList(Client client, int _numResults) async {
    
    try{
      
      final response = await client.get(Uri.parse('https://ll.thespacedevs.com/2.2.0/agencies/?limit=$_numResults'));
      _resp = response;
      errorResponseBool = false;

    }catch(e){

      Response responseCatch = new Response('', 404, reasonPhrase: 'Data not found, check your internet conection.');
      _resp = responseCatch;

    }

    if(errorResponseBool == false){
      if(_resp.statusCode >= 200 && _resp.statusCode < 300) {
        listSpaceAgency = parseSpaceAgencyList(_resp);
      }
    }
    
    return listSpaceAgency;
    // return compute(parseSpaceAgencyList, response);
  }

  List<SpaceAgency> parseSpaceAgencyList(Response response) {
    List<SpaceAgency> _listSpaceAgency = [];

    _resp = response;

    final json = "[" + response.body + "]";
    List<dynamic> data = jsonDecode(json);

    data.forEach((element) { 
      Map obj = element;
      List<dynamic> listObj = obj['results'];


      listObj.forEach((elementResult) { 

        SpaceAgency spaceAgency = new SpaceAgency(
          id: int.parse(elementResult['id'].toString()), 
          url: elementResult['url'].toString(), 
          name: elementResult['name'].toString(), 
          // featured: elementResult['featured'].toString(), 
          type: elementResult['type'].toString(), 
          countryCode: elementResult['country_code'].toString(), 
          abbrev: elementResult['abbrev'].toString(), 
          description: elementResult['description'].toString(), 
          administrator: elementResult['administrator'].toString(), 
          foundingYear: elementResult['founding_year'].toString(), 
          launchers: elementResult['launchers'].toString(), 
          spacecraft: elementResult['spacecraft'].toString(), 
          parent: elementResult['parent'].toString(), 
          imageURL: elementResult['image_url'].toString()
        );

        _listSpaceAgency.add(spaceAgency);
        
      });

    });

    return _listSpaceAgency;
  }

  Response obtainResponse() {
    return _resp;
  }

}
