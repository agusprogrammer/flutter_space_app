
import 'package:flutter_space_app/models/apirest/launch_library/event/event.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class EventService {
  
  late Response _resp;
  late List<Event> listEvent;
  late bool errorResponseBool = true;

  Future <List<Event>> fetchGetEventList(Client client, int _numResults) async {
    
    try{
      
      final response = await client.get(Uri.parse('https://ll.thespacedevs.com/2.2.0/event/?limit=$_numResults'));
      _resp = response;
      errorResponseBool = false;

    }catch(e){

      Response responseCatch = new Response('', 404, reasonPhrase: 'Data not found, check your internet conection.');
      _resp = responseCatch;

    }

    if(errorResponseBool == false){
      if(_resp.statusCode >= 200 && _resp.statusCode < 300) {
        listEvent = parseEventsList(_resp);
      }
    }
    
    return listEvent;
    // return compute(parseEventsList, response);
  }

  List<Event> parseEventsList(Response response){
    List<Event> _listEvent = [];

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

        Map typeMap = elementResult['type'];

        Event event = new Event(
          id: int.parse(elementResult['id'].toString()), 
          url: elementResult['url'].toString(), 
          slug: elementResult['slug'].toString(), 
          name: elementResult['name'].toString(), 
          type: typeMap['name'].toString(), 
          description: elementResult['description'].toString(), 
          location: elementResult['location'].toString(), 
          newsUrl: elementResult['news_url'].toString(), 
          featureImage: elementResult['feature_image'].toString(), 
          date: elementResult['date'].toString(),
          nextResults: nextResultsStr,
          previousResults: previousResultsStr
        );

        _listEvent.add(event);

      });

    });

    return _listEvent;
  }

  Response obtainResponse() {
    return _resp;
  }

}
