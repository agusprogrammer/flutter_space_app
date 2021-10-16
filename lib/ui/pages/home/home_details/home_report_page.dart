import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/report/report.dart';
import 'package:flutter_space_app/services/apirest/spaceflight_news/report_service.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/card_error_status_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/report_widget/report_list.dart';
import 'package:http/http.dart' as http;

class HomeReportPage extends StatelessWidget {
  
  ReportService reportServ = new ReportService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('ISS Reports'),
      ),
      body: FutureBuilder<List<Report>>(
      future: reportServ.fetchGetReportsLimit(http.Client(), 5),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: CardErrorStatusSpApp(
              reportServ.obtainResponse().statusCode.toString(),
              reportServ.obtainResponse().reasonPhrase.toString()
            )
          );
        } else if (snapshot.hasData) {
          return ReportList(reportL: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
    );

  }
}
