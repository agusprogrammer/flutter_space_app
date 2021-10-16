import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/event/event.dart';
import 'package:flutter_space_app/services/apirest/launch_library/event_service.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/card_error_status_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/event_widget/event_list.dart';
import 'package:http/http.dart' as http;

class HomeEventPage extends StatelessWidget {
  
  EventService eventService = new EventService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: FutureBuilder<List<Event>>(
      future: eventService.fetchGetEventList(http.Client(), 2),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: CardErrorStatusSpApp(
              eventService.obtainResponse().statusCode.toString(),
              eventService.obtainResponse().reasonPhrase.toString()
            )
          );
        } else if (snapshot.hasData) {
          return EventList(eventL: snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
      
    );
    
  }
  
}

