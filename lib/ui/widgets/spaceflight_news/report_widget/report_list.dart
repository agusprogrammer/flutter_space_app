import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/report/report.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/report_widget/report_card_item.dart';

class ReportList extends StatelessWidget {
  
  const ReportList({Key? key, required this.reportL}) : super(key: key);

  final List<Report> reportL;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
      child: ListView.builder(
        itemCount: reportL.length,
        itemBuilder: (context, index) {
          return new ReportCardItem(reportL[index]);
        }
      )
    );
  }

}