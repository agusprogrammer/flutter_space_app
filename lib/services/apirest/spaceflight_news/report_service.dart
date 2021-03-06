import 'dart:convert';
import 'package:flutter_space_app/models/apirest/spaceflight_news/report/report.dart';
import 'package:http/http.dart';

class ReportService {
  
  late Response _resp;
  late List<Report> listReports = [];
  late bool errorResponseBool = true;

  // Obtain a list of report with get from url
  Future<List<Report>> fetchGetReportsLimit(Client client, int _numResults) async {

    try{
      
      final response = await client.get(Uri.parse('https://api.spaceflightnewsapi.net/v3/reports?_limit=$_numResults'));
      _resp = response;
      errorResponseBool = false;

    }catch(e){
      Response responseCatch = new Response('', 404, reasonPhrase: 'Data not found, check your internet conection.');
      _resp = responseCatch;
      listReports = parseReports(_resp.body);
    }

    if(errorResponseBool == false) {
      listReports = parseReports(_resp.body);
    }

    return listReports;

  }

  // converts the Json of the response to a list
  List<Report> parseReports(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Report>((json) => Report.fromJson(json)).toList();
  }

  // method for obtain the response for show http errors on graphic interface
  Response obtainResponse() {
    return _resp;
  }

}