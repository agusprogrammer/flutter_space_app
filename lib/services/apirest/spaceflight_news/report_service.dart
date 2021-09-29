
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/report/report.dart';
import 'package:http/http.dart';

class ReportService {
  
  final int _numResults = 10;

  Future<List<Report>> fetchGetReportsLimit(Client client) async {

    final response = await client.get(Uri.parse('https://api.spaceflightnewsapi.net/v3/reports?_limit=$_numResults'));
    return compute(parseReports, response.body);
  }

  List<Report> parseReports(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Report>((json) => Report.fromJson(json)).toList();
  }

}