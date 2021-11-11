
import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launcher/launcher.dart';
import 'package:flutter_space_app/models/hive_database/launch_library/launcher/launcher_hive.dart';
import 'package:flutter_space_app/services/apirest/launch_library/launcher_service.dart';
import 'package:flutter_space_app/services/hive_db_boxes/launch_library/launcher_hive_box.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/navigation_button_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/launcher_widget/launcher_carditem.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '/globals.Dart' as globals;

class LauncherList extends StatefulWidget{
  
  LauncherList({Key? key, required this.launcherL, required this.saveData}) : super(key: key);

  late List<Launcher> launcherL;
  late bool saveData; // save data if dont have errors

  @override
  _LauncherList createState() => _LauncherList(launcherL, saveData);

}

class _LauncherList extends State<LauncherList>{
  
  LauncherService launcherService = new LauncherService();

  ScrollController _scrollController = new ScrollController();

  late bool saveData; // save data if dont have errors
  late List<Launcher> launcherL;
  _LauncherList(this.launcherL, this.saveData);

  late List<Launcher> listLauncherAdd = [];

  @override
  initState() {
    super.initState();

    dataRefresh();

    _scrollController.addListener(() {
      
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){

        double positionMax90 = 0.9 * _scrollController.position.maxScrollExtent;

        fetchGetLaunchersListNextResults(positionMax90);

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
              child: Text('Space Launchers', style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 25)),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 1, top: 5, left: 10, right: 10),
            child: new NavigationButtonSpApp('Spacecraft','spacecraft'))),
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          if (launcherL.length > index) {
            return new LauncherCardItem(launcherL[index]);
            
          }
        }))
      ]
    );

  }

  // obtain the next results for infinite scroll
  fetchGetLaunchersListNextResults(double positionMax90) async {

    Response _response = new Response('', 404);
    late bool errorResponseBool = true;
    late List<Launcher> _launcherLNextResults = [];

    try{

      _response = await http.Client().get(Uri.parse(launcherL.last.nextResults));
      errorResponseBool = false;

    }catch(e){
      errorResponseBool = true;
    }

    if(errorResponseBool == false){

      if(_response.statusCode >= 200 && _response.statusCode < 300) {

        _launcherLNextResults.addAll(launcherService.parseLauncherList(_response));

        launcherL.addAll(_launcherLNextResults);

        if(saveData == true){
          
          listLauncherAdd.clear();
          listLauncherAdd.addAll(_launcherLNextResults);

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

      listLauncherAdd.addAll(launcherL);

      deleteResultsDB();

      if(globals.hiveSaveDateBool == true){
        addResultsDB();
      }
      
    } else {

      if(globals.hiveSaveDateBool == true){
        launcherL = obtainResultsFromDb();
      }
      
    }

  }

  // add all
  addResultsDB() {

    late List<LauncherHive> listLauncherHiveAdd = [];

    for(Launcher launcher in listLauncherAdd){

      late LauncherHive launcherHive = new LauncherHive()
      ..details = launcher.details
      ..firstLaunchDate = launcher.firstLaunchDate
      ..flightProven = launcher.flightProven
      ..flights = launcher.flights
      ..id = launcher.id
      ..imageUrl = launcher.imageUrl
      ..lastLaunchDate = launcher.lastLaunchDate
      ..launchConfFamily = launcher.launchConfFamily
      ..launchConfFullName = launcher.launchConfFullName
      ..launchConfId = launcher.launchConfId
      ..launchConfName = launcher.launchConfName
      ..launchConfUrl = launcher.launchConfUrl
      ..launchConfVariant = launcher.launchConfVariant
      ..nextResults = launcher.nextResults
      ..previousResults = launcher.previousResults
      ..serialNumber = launcher.serialNumber
      ..status = launcher.status
      ..url = launcher.url
      ;

      listLauncherHiveAdd.add(launcherHive);

    }

    var box = LauncherHiveBox.getLauncherBox();
    box.addAll(listLauncherHiveAdd);

  }

  // delete all
  deleteResultsDB() {

    var box = LauncherHiveBox.getLauncherBox();
    box.deleteAll(box.keys);

  }

  // obtain all
  List<Launcher> obtainResultsFromDb() {

    late List<LauncherHive>? launcherHiveList = [];

    var box = LauncherHiveBox.getLauncherBox();
    launcherHiveList = box.values.cast<LauncherHive>().toList();

    List<Launcher> _listLaunches = [];

    for(LauncherHive launcherHive in launcherHiveList){

      late Launcher launcher = new Launcher(id: launcherHive.id, url: launcherHive.url, flightProven: launcherHive.flightProven, 
      serialNumber: launcherHive.serialNumber, status: launcherHive.status, details: launcherHive.details, 
      launchConfId: launcherHive.launchConfId, launchConfUrl: launcherHive.launchConfUrl, 
      launchConfName: launcherHive.launchConfName, launchConfFamily: launcherHive.launchConfFamily, 
      launchConfFullName: launcherHive.launchConfFullName, launchConfVariant: launcherHive.launchConfVariant, 
      imageUrl: launcherHive.imageUrl, flights: launcherHive.flights, lastLaunchDate: launcherHive.lastLaunchDate, 
      firstLaunchDate: launcherHive.firstLaunchDate, nextResults: launcherHive.nextResults, 
      previousResults: launcherHive.previousResults);

       _listLaunches.add(launcher);
    }

    return _listLaunches;

  }


}
