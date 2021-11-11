

import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/space_agency/space_agency.dart';
import 'package:flutter_space_app/models/hive_database/launch_library/space_agency/space_agency_hive.dart';
import 'package:flutter_space_app/services/apirest/launch_library/space_agency_service.dart';
import 'package:flutter_space_app/services/hive_db_boxes/launch_library/space_agency_hive_box.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/space_agency_widget/space_agency_carditem.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '/globals.Dart' as globals;

class SpaceAgencyList extends StatefulWidget {
  
  SpaceAgencyList({Key? key, required this.spaceAgencyL, required this.saveData}) : super(key: key); 

  late List<SpaceAgency> spaceAgencyL = [];
  late bool saveData; // save data if dont have errors

  @override
  _SpaceAgencyListState createState() => _SpaceAgencyListState(spaceAgencyL, saveData);
  
}

class _SpaceAgencyListState extends State<SpaceAgencyList>{
  
  SpaceAgencyService spaceAgencyService = new SpaceAgencyService();

  ScrollController _scrollController = new ScrollController();

  late bool saveData; // save data if dont have errors
  late List<SpaceAgency> spaceAgencyL;
  
  _SpaceAgencyListState(this.spaceAgencyL, this.saveData);

  late List<SpaceAgency> listSpaceAgencyAdd = [];

  @override
  initState() {
    super.initState();

    dataRefresh();
    
    _scrollController.addListener(() {
      
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){

        double positionMax90 = 0.9 * _scrollController.position.maxScrollExtent;

        fetchGetSpaceAgencyListNextResults(positionMax90);
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
              child: Text('Space Agencies', style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 25)),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
          (context, index) {
          
            if (spaceAgencyL.length > index) {
              return new SpaceAgencyCardItem(spaceAgencyL[index]); 
            }
            
          }),
        ),
      ]
    );

  }

  // obtain the next results for infinite scroll
  fetchGetSpaceAgencyListNextResults(double positionMax90) async {

    Response _response = new Response('', 404);
    late bool errorResponseBool = true;
    late List<SpaceAgency> _spaceAgencyLNextResults = [];

    try{

      _response = await http.Client().get(Uri.parse(spaceAgencyL.last.nextResults));
      errorResponseBool = false;

    }catch(e){
      errorResponseBool = true;
    }

    if(errorResponseBool == false){

      if(_response.statusCode >= 200 && _response.statusCode < 300) {

        _spaceAgencyLNextResults.addAll(spaceAgencyService.parseSpaceAgencyList(_response));

        spaceAgencyL.addAll(_spaceAgencyLNextResults);

        if(saveData == true){

          listSpaceAgencyAdd.clear();
          listSpaceAgencyAdd.addAll(_spaceAgencyLNextResults);

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

      listSpaceAgencyAdd.addAll(spaceAgencyL);

      deleteResultsDB();

      if(globals.hiveSaveDateBool == true){
        addResultsDB();
      }
      

    } else {

      if(globals.hiveSaveDateBool == true){
        spaceAgencyL = obtainResultsFromDb();
      }
      
    }

  }

  // add all
  addResultsDB() {

    late List<SpaceAgencyHive> listSpaceAgencyHiveAdd = [];

    for(SpaceAgency spaceAgency in listSpaceAgencyAdd){
      
      late SpaceAgencyHive spaceAgencyHive = new SpaceAgencyHive()
      ..abbrev = spaceAgency.abbrev
      ..administrator = spaceAgency.administrator
      ..countryCode = spaceAgency.countryCode
      ..description = spaceAgency.description
      ..foundingYear = spaceAgency.foundingYear
      ..id = spaceAgency.id
      ..imageURL = spaceAgency.imageURL
      ..launchers = spaceAgency.launchers
      ..name = spaceAgency.name
      ..nextResults = spaceAgency.nextResults
      ..parent = spaceAgency.parent
      ..previousResults = spaceAgency.previousResults
      ..spacecraft = spaceAgency.spacecraft
      ..type = spaceAgency.type
      ..url = spaceAgency.url
      ;

      listSpaceAgencyHiveAdd.add(spaceAgencyHive);

    }

    var box = SpaceAgencyHiveBox.getSpaceAgencyBox();
    box.addAll(listSpaceAgencyHiveAdd);

  }

  // delete all
  deleteResultsDB() {

    var box = SpaceAgencyHiveBox.getSpaceAgencyBox();
    box.deleteAll(box.keys);

  }

  // obtain all
  List<SpaceAgency> obtainResultsFromDb() {

    late List<SpaceAgencyHive>? spaceAgencyHiveList = [];

    var box = SpaceAgencyHiveBox.getSpaceAgencyBox();
    spaceAgencyHiveList = box.values.cast<SpaceAgencyHive>().toList();

    List<SpaceAgency> _listSpaceAgency = [];

    for(SpaceAgencyHive spaceAgencyHive in spaceAgencyHiveList){

      late SpaceAgency spaceAgency = new SpaceAgency(id: spaceAgencyHive.id, url: spaceAgencyHive.url, name: spaceAgencyHive.name, 
      type: spaceAgencyHive.type, countryCode: spaceAgencyHive.countryCode, abbrev: spaceAgencyHive.abbrev, description: spaceAgencyHive.description, 
      administrator: spaceAgencyHive.administrator, foundingYear: spaceAgencyHive.foundingYear, launchers: spaceAgencyHive.launchers, 
      spacecraft: spaceAgencyHive.spacecraft, parent: spaceAgencyHive.parent, imageURL: spaceAgencyHive.imageURL, 
      nextResults: spaceAgencyHive.nextResults, previousResults: spaceAgencyHive.previousResults);

      _listSpaceAgency.add(spaceAgency);
    }

    return _listSpaceAgency; 
  }


}

