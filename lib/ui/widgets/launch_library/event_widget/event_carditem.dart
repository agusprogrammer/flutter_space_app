import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/event/event.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/navigation_url_button_sp_app.dart';

class EventCardItem extends StatefulWidget{
  
  final Event event;
  EventCardItem(this.event);

  @override
  _EventCardItemState createState() => _EventCardItemState(this.event);

}

class _EventCardItemState extends State<EventCardItem>{
  
  late Event event;
  _EventCardItemState(this.event);

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
                      image: NetworkImage(this.event.featureImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 5),
                  child: Text(this.event.name, style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 22)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.event.description, style: TextStyle(color: Colors.black, fontSize: 20)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.event.date, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.event.location, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.event.type, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                NavigationUrlButton('More', this.event.newsUrl)

              ]
            )
          )
         )
      )
    );
  }

}