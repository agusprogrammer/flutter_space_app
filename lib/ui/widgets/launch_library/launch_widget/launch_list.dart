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
  
  late List<Launch> launchL = [];
  _LaunchListState(this.launchL, this.saveData);

  late bool saveData;
  late List<Launch> listLaunchesAdd = [];

  // late bool scrollPosMaxBool = false;
  // late double positionMax = 0;

  @override
  initState() {
    super.initState();

    // timeRequest();
    // openTheBox();
    saveDataM();
    
    _scrollController.addListener(() {
      
      /*
      if(scrollPosMaxBool == false) {
        positionMax = _scrollController.position.maxScrollExtent - 60.0;
        scrollPosMaxBool = true;
      }
      */

      // var triggerFetchMoreSize = 0.9 * _scrollController.position.maxScrollExtent;

      // if(_scrollController.position.pixels > triggerFetchMoreSize){
      
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      
        // if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){

        // if(_scrollController.position.pixels == triggerFetchMoreSize){

        double positionPixels = _scrollController.position.pixels;
        double positionMax90 = 0.9 * _scrollController.position.maxScrollExtent;

        

        print(positionPixels);
        print(positionMax90);

        fetchGetLaunchListNextResults(positionMax90);
      }
    });

  }

  openTheBox(){
    
    
    
    // Hive.openBox<LaunchHive>('launch_hive_box');
    // boxOpened = Hive.isBoxOpen('launch_hive_box');


    // LaunchHiveBox.getLaunches();
    // LaunchHiveBox.openBoxLaunchHiveBox();

  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();

    // Hive.close(); // close all boxes
    Hive.box('launch_hive_box').close(); // close single box
    // LaunchHiveBox.closeBoxLaunchHiveBox();
  }

  @override
  Widget build(BuildContext context) {
    
    /*
    return Container(
      decoration: new BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
      child: ListView.builder(
        itemCount: launchL.length,
        itemBuilder: (context, index) {
          return new LaunchCardItem(launchL[index]);
        }
      )
    );
    */

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
          
          // guardar el listLaunchesAdd del scroll infinito en la base de datos
          // addResultsDB();

            if (launchL.length > index) {
              return new LaunchCardItem(launchL[index]); 
            }
            
            /*
            else{
              return new CircularProgressIndicator();
            }*/
          
          }),
        ),
      ],
    );
  }

  // obtain the next results for infinite scroll
  
  /*
  fetchNextResults() {
    
    List<Launch> listLaunchesLastFuture = [];

    // listLaunchesLastFuture = futureListLaunches as List<Launch>;
    String _nextResultsStr = launchL.last.nextResults;
    // listLaunchesLastFuture = launchService.fetchGetLaunchListNextResults(http.Client(), _nextResultsStr) as List<Launch>;
    // launchL.addAll(listLaunchesLastFuture);

  }
  */

  fetchGetLaunchListNextResults(double positionMax90) async {
    
    // late String _nextResults = '';
    Response _response = new Response('', 404);
    late bool errorResponseBool = true;

    // _nextResults = launchL.last.nextResults;
    // print(launchL.last.nextResults);

    late List<Launch> _launchLNextResults = [];
    // _launchLNextResults.clear();

    try{

      _response = await http.Client().get(Uri.parse(launchL.last.nextResults));
      errorResponseBool = false;

    }catch(e){
      errorResponseBool = true;
    }

    if(errorResponseBool == false){
      
      if(_response.statusCode >= 200 && _response.statusCode < 300) {
        // _listLaunch = parseLaunchList(_response);
        _launchLNextResults.addAll(launchService.parseLaunchList(_response));

        for(Launch launch in _launchLNextResults) {
          print('Launch scroll: ' + launch.name);
        }

        launchL.addAll(_launchLNextResults);
        // scrollPosMaxBool = false;

        if(saveData == true){
          
          listLaunchesAdd.clear();
          listLaunchesAdd.addAll(_launchLNextResults);

          // _scrollController.notifyListeners();

          /*
          for(Launch launchAdd in listLaunchesAdd){
            print('Launch add: ' + launchAdd.name);
          }
          */

          _scrollController.jumpTo(positionMax90);

          // sino va mirar el ciclo de vida
          // addResultsDB();

        }
        
        // prueba de scroll borrar luego
      } else {
        // launchL.addAll(obtainResultsFromDb());
        // _scrollController.notifyListeners();
        
        _scrollController.jumpTo(positionMax90);
        print(launchL.length.toString());
        
        // prueba, borrar luego
        // listLaunchesAdd.clear();
        // listLaunchesAdd.addAll(_launchLNextResults);

        // addResultsDB();
      }
    
    } 

  }

  // database
  

  // save data
  saveDataM(){

    if(saveData == true){

      listLaunchesAdd.addAll(launchL);

      // hacer un select antes si eso

      deleteResultsDB();
      addResultsDB();

    } else {
      launchL = obtainResultsFromDb();
    }

  }

  // add all
  addResultsDB() {
    
    late List<LaunchHive> listLaunchHiveAdd = [];

    for(Launch launch in listLaunchesAdd){

      //print(launch.padLocationName);
      
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

    // var box = Hive.box('launch_hive_box');
    var box = LaunchHiveBox.getLaunches();
    box.addAll(listLaunchHiveAdd);
    
    // final launchHiveBox = LaunchHiveBox.getLaunches(); 
    // launchHiveBox.addAll(listLaunchHiveAdd);
    

    
    // late List<LaunchHive> _listLaunchHiveSelect = [];

    // final boxSelect = LaunchHiveBox.getLaunches();
    // _listLaunchHiveSelect = box.values.cast<LaunchHive>().toList();

    /*
    for(LaunchHive launchHive in _listLaunchHiveSelect){
      print(launchHive.name.toString());
    }
    */
    
  }

  // delete
  deleteResultsDB() {
    
    // final launchHiveBox = LaunchHiveBox.getLaunches(); 
    // late List<LaunchHive>? launchHiveList = [];
    var box = LaunchHiveBox.getLaunches();

    // launchHiveList = launchHiveBox.values.cast<LaunchHive>().toList();
    // launchHiveList = box.values.cast<LaunchHive>().toList();

    // box.clear();
    box.deleteAll(box.keys);
    
    // launchHiveList = [];
    // launchHiveList = box.values.cast<LaunchHive>().toList();


  }

  // select
  List<Launch> obtainResultsFromDb() {
    // futureListLaunches
    late List<LaunchHive>? launchHiveList = [];

    // ver si obtine datos asi:

    // Otra forma:

    // ValueListenable<Box<LaunchHive>> valueListenable = LaunchHiveBox.getLaunches().listenable();
    // launchHiveList = valueListenable as List<LaunchHive>;

    // usando un box:
    var box = LaunchHiveBox.getLaunches();
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

    // print('length: ' + _listLaunches.length.toString());

    return  _listLaunches;

  }

}
