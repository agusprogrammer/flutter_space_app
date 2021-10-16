import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/report/report.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/navigation_url_button_sp_app.dart';

class ReportCardItem extends StatelessWidget{

  late Report reportItem;
  ReportCardItem(this.reportItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(bottom: 15, top: 10, left: 15, right: 15),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          shadowColor: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
               mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Ink(
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                    image: DecorationImage(
                      image: NetworkImage(this.reportItem.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 5),
                  child: Text(this.reportItem.title, style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 22)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.reportItem.summary, style: TextStyle(color: Colors.black, fontSize: 20)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('News site: ' + this.reportItem.newsSite, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Text('Published at: ' + this.reportItem.publishedAt, style: TextStyle(color: Colors.grey, fontSize: 15)),

                NavigationUrlButton('More', this.reportItem.url)
                
              ]
            )
            )
        )
      )
    );
  }

}