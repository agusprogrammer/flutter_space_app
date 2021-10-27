import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launch/launch.dart';
import 'package:flutter_space_app/models/hive_database/launch_library/launch/launch_hive.dart';
import 'package:flutter_space_app/services/apirest/launch_library/launch_service.dart';
import 'package:flutter_space_app/services/hive_db_boxes/launch_hive_box.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/card_error_status_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/launch_widget/launch_list.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '/globals.Dart' as globals;

class LaunchPage extends StatefulWidget{
  
  @override
  _LaunchPageState createState() => _LaunchPageState();

}

class _LaunchPageState extends State<LaunchPage> {
  
  
  LaunchService launchService = new LaunchService();
  Future<List<Launch>>? futureListLaunches;
  List<Launch> listLaunchesAdd = [];
  bool firstResults = true;
  
  @override
  void initState() {
    super.initState();

    if(firstResults == true){
      
      // delayRequest();
      fetchFirstResults();
      // futureListLaunches = obtainResultsFromDb();

      firstResults = false;

    }

  }

  

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    // addResultsDB();
  }

  // borrar si eso
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Launch>>(
      // future: launchService.fetchGetLaunchList(http.Client(), 3),
      future: futureListLaunches,
      builder: (context, snapshot) {
        if (snapshot.hasError) {

          if(globals.hiveStrorageBool == true){
            late List<Launch> launchL = [];
            return LaunchList(launchL: launchL, saveData: false);

          } else {
            return Center( child: CardErrorStatusSpApp(
              launchService.obtainResponse().statusCode.toString(),
              launchService.obtainResponse().reasonPhrase.toString()
            ));
          }
          
        } else if (snapshot.hasData) {
          return LaunchList(launchL: snapshot.data!, saveData: true);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });
    
  }

  // obtain the first results
  fetchFirstResults() {
    futureListLaunches = launchService.fetchGetLaunchList(http.Client(), 3);
    
    /*
    futureListLaunches!.then((listValue) {
      listLaunchesAdd = listValue;
    });
    */
    
  }

  /*
  Future<void> _getIntNextHourSharedRequest() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    nextHour = 0;
    
    if(_prefs.getInt('nexthour') == null) {
      nextHour = 0;
    } else {
      nextHour = _prefs.getInt('nexthour')!;
    }

    // return nextHour;

  }

  Future<void> _updateNextHourSharedRequest(int nextHour) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setInt('nexthour', nextHour);
  }

  Future<void> _resetNextHourSharedRequest() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setInt('nexthour', 0);
  }
  */

  // method for dealy the requests and avoid the http error 429 Too many requests
  /*
  Future<void> delayRequest() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    int _nextHour = 0;

    // delete all shared prefs
    //_prefs.clear();

    // comprobar y extaer
    
    if(_prefs.getInt('nexthour') == null) {
      _nextHour = 0;
    } else {
      _nextHour = _prefs.getInt('nexthour')!;
    }
    
    // _getIntNextHourSharedRequest();
    // _nextHour = nextHour;

    // var nowDate = new DateTime.now();
    int miliseconds = DateTime.now().millisecondsSinceEpoch;
    double doubleHours = 0;
    int hoursNow = 0; 

    doubleHours = (((miliseconds / 1000)/60)/60);
    hoursNow = doubleHours.truncate();

    // fetchFirstResults();

    if(hoursNow > _nextHour){
      int _nextFutureHour = 0;
      
      _nextFutureHour = hoursNow + 5; // increment the number of hours
      
      await _prefs.setInt('nexthour', _nextFutureHour); // update preference

      fetchFirstResults(); // fetch new results
      
    } else {
      // obtainResultsFromDb(); // save on list future
    }

  }
  */

}