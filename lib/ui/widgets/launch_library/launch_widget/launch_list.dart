import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launch/launch.dart';
import 'package:flutter_space_app/models/hive_database/launch_library/launch/launch_hive.dart';
import 'package:flutter_space_app/services/hive_db_boxes/launch_hive_box.dart';
import 'package:flutter_space_app/services/hive_db_boxes/launch_hive_box.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/launch_widget/launch_carditem.dart';
import 'package:flutter_space_app/services/apirest/launch_library/launch_service.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/globals.Dart' as globals;

class LaunchList extends StatefulWidget {
  
  LaunchList({Key? key, required this.launchL, required this.saveData}) : super(key: key); 

  late List<Launch> launchL = [];
  late bool saveData; // save data if dont have errors

  @override
  _LaunchListState createState() => _LaunchListState(launchL, saveData);

}

class _LaunchListState extends State<LaunchList> {
  
  LaunchService launchService = new LaunchService();
  
  ScrollController _scrollController = new ScrollController();
  
  late bool saveData;
  late List<Launch> launchL = [];
  _LaunchListState(this.launchL, this.saveData);

  late List<Launch> listLaunchesAdd = [];

  @override
  initState() {
    super.initState();

    dataRefresh();
    
    _scrollController.addListener(() {
      
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){

        double positionMax90 = 0.9 * _scrollController.position.maxScrollExtent;

        fetchGetLaunchListNextResults(positionMax90);
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
              child: Text('Launches', style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 25)),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
          (context, index) {
          
            if (launchL.length > index) {
              return new LaunchCardItem(launchL[index]); 
            }
            
          }),
        ),
      ],
    );
  }

  // obtain the next results for infinite scroll
  fetchGetLaunchListNextResults(double positionMax90) async {
    
    Response _response = new Response('', 404);
    late bool errorResponseBool = true;
    late List<Launch> _launchLNextResults = [];

    try{

      _response = await http.Client().get(Uri.parse(launchL.last.nextResults));
      errorResponseBool = false;

    }catch(e){
      errorResponseBool = true;
    }

    if(errorResponseBool == false){
      
      if(_response.statusCode >= 200 && _response.statusCode < 300) {

        _launchLNextResults.addAll(launchService.parseLaunchList(_response));

        launchL.addAll(_launchLNextResults);

        if(saveData == true){
          
          listLaunchesAdd.clear();
          listLaunchesAdd.addAll(_launchLNextResults);

          _scrollController.jumpTo(positionMax90);

        }
        
      } 
    
    } 

  }
  

  // refresh the database
  dataRefresh(){

    if(saveData == true){

      listLaunchesAdd.addAll(launchL);

      deleteResultsDB();
      if(globals.hiveSaveDateBool == true){
        addResultsDB();
      }
      
    } else {

      if(globals.hiveSaveDateBool == true){
        launchL = obtainResultsFromDb();
      }
      
    }

  }

  // add all
  addResultsDB() {
    
    late List<LaunchHive> listLaunchHiveAdd = [];

    for(Launch launch in listLaunchesAdd){

      late LaunchHive launchHive = new LaunchHive()
      ..id = launch.id
      ..url = launch.url
      ..slug = launch.slug
      ..name = launch.name
      ..statusId = launch.statusId
      ..statusName = launch.statusName
      ..statusAbbrev = launch.statusAbbrev
      ..statusDescription = launch.statusDescription
      ..lastUpdated = launch.lastUpdated
      ..net = launch.net
      ..windowEnd = launch.windowEnd
      ..windowStart = launch.windowStart
      ..holdreason = launch.holdreason
      ..failreason = launch.failreason
      ..launchServProvId = launch.launchServProvId
      ..launchServProvUrl = launch.launchServProvUrl
      ..launchServProvName = launch.launchServProvName
      ..launchServProvType = launch.launchServProvType
      ..rocketName = launch.rocketName
      ..rocketFullName = launch.rocketFullName
      ..rocketFamily = launch.rocketFamily
      ..rocketVariant = launch.rocketVariant
      ..missionName = launch.missionName
      ..missionDescription = launch.missionDescription
      ..missionLaunchDesignator = launch.missionLaunchDesignator
      ..missionType = launch.missionType
      ..missionOrbitName = launch.missionOrbitName
      ..missionOrbitAbbrev = launch.missionOrbitAbbrev
      ..padLocationName = launch.padLocationName
      ..image = launch.image
      ..infographic = launch.infographic
      ..nextResults = launch.nextResults
      ..previousResults = launch.previousResults
      ;

      listLaunchHiveAdd.add(launchHive);

    }

    var box = LaunchHiveBox.getLaunchBox();
    box.addAll(listLaunchHiveAdd);
    
    
  }

  // delete
  deleteResultsDB() {
    
    var box = LaunchHiveBox.getLaunchBox();
    box.deleteAll(box.keys);

  }

  // select
  List<Launch> obtainResultsFromDb() {

    late List<LaunchHive>? launchHiveList = [];

    var box = LaunchHiveBox.getLaunchBox();
    launchHiveList = box.values.cast<LaunchHive>().toList();

    List<Launch> _listLaunches = [];

    for(LaunchHive launchHive in launchHiveList){

      late Launch launch = new Launch(id: launchHive.id, url: launchHive.url, slug: launchHive.slug, name: launchHive.name, 
      statusId: launchHive.statusId, statusName: launchHive.statusName, statusAbbrev: launchHive.statusAbbrev, 
      statusDescription: launchHive.statusDescription, lastUpdated: launchHive.lastUpdated, net: launchHive.net, 
      windowEnd: launchHive.windowEnd, windowStart: launchHive.windowStart, holdreason: launchHive.holdreason, 
      failreason: launchHive.failreason, launchServProvId: launchHive.launchServProvId, launchServProvUrl: launchHive.launchServProvUrl, 
      launchServProvName: launchHive.launchServProvName, launchServProvType: launchHive.launchServProvType, 
      rocketName: launchHive.rocketName, rocketFamily: launchHive.rocketFamily, rocketFullName: launchHive.rocketFullName, 
      rocketVariant: launchHive.rocketVariant, missionName: launchHive.missionName, missionDescription: launchHive.missionDescription, 
      missionLaunchDesignator: launchHive.missionLaunchDesignator, missionType: launchHive.missionType, missionOrbitName: launchHive.missionOrbitName, 
      missionOrbitAbbrev: launchHive.missionOrbitAbbrev, padLocationName: launchHive.padLocationName, 
      image: launchHive.image, infographic: launchHive.infographic, nextResults: launchHive.nextResults, 
      previousResults: launchHive.previousResults);

      _listLaunches.add(launch);

    }

    return  _listLaunches;

  }

}
