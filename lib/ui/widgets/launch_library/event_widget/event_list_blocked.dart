import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/event/event.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/event_widget/event_carditem.dart';

class EventListBlocked extends StatefulWidget {
  
  const EventListBlocked({Key? key, required this.eventL}) : super(key: key);

  final List<Event> eventL;

  @override
  State<StatefulWidget> createState() => _EventListBlockedState(eventL);

}

class _EventListBlockedState extends State<EventListBlocked>{

  final List<Event> eventL;
  _EventListBlockedState(this.eventL);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
      child: ListView.builder(
         physics: const NeverScrollableScrollPhysics(),
         itemCount: eventL.length,
         itemBuilder: (context, index) {
          return new EventCardItem(eventL[index]);
        },
      )
    );
  }
  
}