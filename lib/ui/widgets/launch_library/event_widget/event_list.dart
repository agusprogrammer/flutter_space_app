import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/event/event.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/event_widget/event_carditem.dart';

class EventList extends StatefulWidget {
  
  const EventList({Key? key, required this.eventL}) : super(key: key);

  final List<Event> eventL;

  @override
  State<StatefulWidget> createState() => _EventListState(eventL);

}

class _EventListState extends State<EventList>{

  final List<Event> eventL;
  _EventListState(this.eventL);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
      child: ListView.builder(
         // physics: const NeverScrollableScrollPhysics(),
         itemCount: eventL.length,
         itemBuilder: (context, index) {
          return new EventCardItem(eventL[index]);
        },
      )
    );
  }
  
}