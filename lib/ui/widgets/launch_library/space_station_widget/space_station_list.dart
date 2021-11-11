import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/space_station/space_station.dart';
import 'package:flutter_space_app/models/hive_database/launch_library/space_station/space_station_hive.dart';
import 'package:flutter_space_app/services/apirest/launch_library/space_station_service.dart';
import 'package:flutter_space_app/services/hive_db_boxes/launch_library/space_station_hive_box.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/navigation_button_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/space_station_widget/space_station_carditem.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '/globals.Dart' as globals;

class SpaceStationList extends StatefulWidget {
  
  SpaceStationList({Key? key, required this.spaceStationL, required this.saveData}) : super(key: key);

  late List<SpaceStation> spaceStationL;
  late bool saveData; // save data if dont have errors

  @override
  _SpaceStationState createState() => _SpaceStationState(this.spaceStationL, this.saveData);
    
}

class _SpaceStationState extends State<SpaceStationList>{
  
  SpaceStationService spaceStationService = new SpaceStationService();

  ScrollController _scrollController = new ScrollController();

  late bool saveData; // save data if dont have errors
  late List<SpaceStation> spaceStationL;

  _SpaceStationState(this.spaceStationL, this.saveData);

  late List<SpaceStation> listSpaceStationAdd = [];

   @override
  initState() {
    super.initState();

    dataRefresh();
    
    _scrollController.addListener(() {

      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){

        double positionMax90 = 0.9 * _scrollController.position.maxScrollExtent;

        fetchGetSpaceStationListNextResults(positionMax90);
      }

    });

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
              child: Text('Space Stations', style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 25)),
            ),
          ),
          ),
          SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 1, top: 5, left: 10, right: 10),
            child: new NavigationButtonSpApp('Astronauts','astronaut'))),
          SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 1, top: 5, left: 10, right: 10),
            child: new NavigationButtonSpApp('Agencies','agency'))),
          SliverList(delegate: SliverChildBuilderDelegate((context, index) {
            if (spaceStationL.length > index) {
              return new SpaceStationCardItem(spaceStationL[index]);
            }
          }))
         ]
      );

  }

  // obtain the next results for infinite scroll
  fetchGetSpaceStationListNextResults(double positionMax90) async {

    Response _response = new Response('', 404);
    late bool errorResponseBool = true;
    late List<SpaceStation> _spaceStationLNextResults = [];

    try{

      _response = await http.Client().get(Uri.parse(spaceStationL.last.nextResults));
      errorResponseBool = false;

    }catch(e){
      errorResponseBool = true;
    }

    if(errorResponseBool == false){

      if(_response.statusCode >= 200 && _response.statusCode < 300) {

        _spaceStationLNextResults.addAll(spaceStationService.parseSpaceStations(_response));

        spaceStationL.addAll(_spaceStationLNextResults);

        if(saveData == true){

          listSpaceStationAdd.clear();
          listSpaceStationAdd.addAll(_spaceStationLNextResults);

          _scrollController.jumpTo(positionMax90);

        }

      }

    }

  }

  // Updadate hive database, first erase the last data after save new data
  // but if we have an error and cannot show the data that come 
  // from eventL list obtain the stored data
  dataRefresh(){

    if(saveData == true){

      listSpaceStationAdd.addAll(spaceStationL);

      deleteResultsDB();

      if(globals.hiveSaveDateBool == true){
        addResultsDB();
      }
      
    } else {

      if(globals.hiveSaveDateBool == true){
        spaceStationL = obtainResultsFromDb();
      }
      
    }

  }

  // add all
  addResultsDB() {

    late List<SpaceStationHive> listSpaceStationHiveAdd = [];

    for(SpaceStation spaceStation in listSpaceStationAdd){

      late SpaceStationHive spaceStationHive = new SpaceStationHive()
      ..deorbited = spaceStation.deorbited
      ..description = spaceStation.description
      ..founded = spaceStation.founded
      ..id = spaceStation.id
      ..idStatus = spaceStation.idStatus
      ..idType = spaceStation.idType
      ..imageUrl = spaceStation.imageUrl
      ..name = spaceStation.name
      ..nextResults = spaceStation.nextResults
      ..orbit = spaceStation.orbit
      ..previousResults = spaceStation.previousResults
      ..status = spaceStation.status
      ..type = spaceStation.type
      ..url = spaceStation.url
      ;

      listSpaceStationHiveAdd.add(spaceStationHive);

    }

    var box = SpaceStationHiveBox.getSpaceStationBox();
    box.addAll(listSpaceStationHiveAdd);

  }

  // delete all
  deleteResultsDB() {
    var box = SpaceStationHiveBox.getSpaceStationBox();
    box.deleteAll(box.keys);
  }

  // obtain all
  List<SpaceStation> obtainResultsFromDb() {

    late List<SpaceStationHive>? spaceStationHiveList = [];

    var box = SpaceStationHiveBox.getSpaceStationBox();
    spaceStationHiveList = box.values.cast<SpaceStationHive>().toList();

    List<SpaceStation> _listSpaceStation = [];

    for(SpaceStationHive spaceStationHive in spaceStationHiveList){

      late SpaceStation spaceStation = new SpaceStation(id: spaceStationHive.id, url: spaceStationHive.url, name: spaceStationHive.name, 
      idStatus: spaceStationHive.idStatus, status: spaceStationHive.status, idType: spaceStationHive.idType, type: spaceStationHive.type, 
      founded: spaceStationHive.founded, deorbited: spaceStationHive.deorbited, description: spaceStationHive.description, 
      orbit: spaceStationHive.orbit, imageUrl: spaceStationHive.imageUrl, nextResults: spaceStationHive.nextResults, 
      previousResults: spaceStationHive.previousResults);

      _listSpaceStation.add(spaceStation);

    }

    return _listSpaceStation;

  }


}