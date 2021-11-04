import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/event/event.dart';
import 'package:flutter_space_app/models/hive_database/launch_library/event/event_hive.dart';
import 'package:flutter_space_app/services/apirest/launch_library/event_service.dart';
import 'package:flutter_space_app/services/hive_db_boxes/event_hive_box.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/event_widget/event_carditem.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '/globals.Dart' as globals;

class EventList extends StatefulWidget {
  
  EventList({Key? key, required this.eventL, required this.saveData}) : super(key: key);

  late List<Event> eventL = [];
  late bool saveData; // save data if dont have errors

  @override
  State<StatefulWidget> createState() => _EventListState(eventL, saveData);

}

class _EventListState extends State<EventList>{
  
  EventService eventService = new EventService();

  ScrollController _scrollController = new ScrollController();

  late bool saveData;
  late List<Event> eventL;
  _EventListState(this.eventL, this.saveData);

  late List<Event> listEventsAdd = [];

  @override
  initState() {
    super.initState();

    dataRefresh();

    _scrollController.addListener(() {

      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){

        double positionMax90 = 0.9 * _scrollController.position.maxScrollExtent;

        fetchGetEventListNextResults(positionMax90);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5, top: 35, left: 10, right: 10),
              child: Text('Events', style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 25)),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
          (context, index) {
          
            if (eventL.length > index) {
              return new EventCardItem(eventL[index]); 
            }
            
          }),
        ),
      ],
    );

  }

  // obtain the next results for infinite scroll
  fetchGetEventListNextResults(double positionMax90) async {
    
    Response _response = new Response('', 404);
    late bool errorResponseBool = true;
    late List<Event> _eventLNextResults = [];

    try{

      _response = await http.Client().get(Uri.parse(eventL.last.nextResults));
      errorResponseBool = false;

    }catch(e){
      errorResponseBool = true;
    }

    if(errorResponseBool == false){
      
      if(_response.statusCode >= 200 && _response.statusCode < 300) {

        _eventLNextResults.addAll(eventService.parseEventsList(_response));

        eventL.addAll(_eventLNextResults);

        if(saveData == true){
          
          listEventsAdd.clear();
          listEventsAdd.addAll(_eventLNextResults);

          _scrollController.jumpTo(positionMax90);

        }
        
      } 
    
    } 

  }

  dataRefresh(){

    if(saveData == true){

      listEventsAdd.addAll(eventL);

      deleteResultsDB();

      if(globals.hiveSaveDateBool == true){
        addResultsDB();
      }
      
    } else {

      if(globals.hiveSaveDateBool == true){
        eventL = obtainResultsFromDb();
      }
      
    }

  }

  // add all
  addResultsDB() {

    late List<EventHive> listEventHiveAdd = [];

    for(Event event in listEventsAdd){

      late EventHive eventHive = new EventHive()
      ..date = event.date
      ..description = event.description
      ..featureImage = event.featureImage
      ..id = event.id
      ..location = event.location
      ..name = event.name
      ..newsUrl = event.newsUrl
      ..nextResults = event.nextResults
      ..previousResults = event.previousResults
      ..slug = event.slug
      ..type = event.type
      ..url = event.url
      ;

      listEventHiveAdd.add(eventHive);

    }

    var box = EventHiveBox.getEventBox();
    box.addAll(listEventHiveAdd);

  }

  deleteResultsDB() {

    var box = EventHiveBox.getEventBox();
    box.deleteAll(box.keys);

  }
  
  List<Event> obtainResultsFromDb() {

    late List<EventHive>? eventHiveList = [];

    var box = EventHiveBox.getEventBox();
    eventHiveList = box.values.cast<EventHive>().toList();

    List<Event> _listEvents = [];

    for(EventHive eventHive in eventHiveList){

      late Event event = new Event(date: eventHive.date, description: eventHive.description, 
      featureImage: eventHive.featureImage, 
      id: eventHive.id, location: eventHive.location, name: eventHive.name, 
      newsUrl: eventHive.newsUrl, nextResults: eventHive.nextResults, 
      previousResults: eventHive.previousResults, slug: eventHive.slug, 
      type: eventHive.type, url: eventHive.url);

      _listEvents.add(event);
    }

    return _listEvents;

  }

}