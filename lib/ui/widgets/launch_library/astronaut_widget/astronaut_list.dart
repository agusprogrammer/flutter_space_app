import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/astronaut/astronaut.dart';
import 'package:flutter_space_app/models/hive_database/launch_library/astronaut/astronaut_hive.dart';
import 'package:flutter_space_app/services/apirest/launch_library/astronaut_service.dart';
import 'package:flutter_space_app/services/hive_db_boxes/astronaut_hive_box.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/astronaut_widget/astronaut_carditem.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '/globals.Dart' as globals;

class AstronautList extends StatefulWidget{
  
  AstronautList({Key? key, required this.astronautL, required this.saveData}) : super(key: key);

  late List<Astronaut> astronautL;
  late bool saveData; // save data if dont have errors

  @override
  _AstronautList createState() => _AstronautList(astronautL, saveData);

}

class _AstronautList extends State<AstronautList>{
  
  AstronautService astronautService = new AstronautService();

  ScrollController _scrollController = new ScrollController();

  late bool saveData;
  late List<Astronaut> astronautL;
  _AstronautList(this.astronautL, this.saveData);

  late List<Astronaut> listAstronautsAdd = [];
  
  @override
  initState() {
    super.initState();

    dataRefresh();

    _scrollController.addListener(() {

      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){

        double positionMax90 = 0.9 * _scrollController.position.maxScrollExtent;

        fetchGetAstronautListNextResults(positionMax90);
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
              child: Text('Astronauts', style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 25)),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
          (context, index) {
          
            if (astronautL.length > index) {
              return new AstronautCardItem(astronautL[index]); 
            }
            
          }),
        ),
      ]
    );

  }

  // obtain the next results for infinite scroll
  
  fetchGetAstronautListNextResults(double positionMax90) async {

    Response _response = new Response('', 404);
    late bool errorResponseBool = true;
    late List<Astronaut> _astronautLNextResults = [];

    try{

      _response = await http.Client().get(Uri.parse(astronautL.last.nextResults));
      errorResponseBool = false;

    }catch(e){
      errorResponseBool = true;
    }

    if(errorResponseBool == false){
      
      if(_response.statusCode >= 200 && _response.statusCode < 300) {

        _astronautLNextResults.addAll(astronautService.parseAstronautList(_response));

        astronautL.addAll(_astronautLNextResults);

        if(saveData == true){
          
          listAstronautsAdd.clear();
          listAstronautsAdd.addAll(_astronautLNextResults);

          _scrollController.jumpTo(positionMax90);

        }
        
      } 
    
    } 

  }

  dataRefresh(){

    if(saveData == true){

      listAstronautsAdd.addAll(astronautL);

      deleteResultsDB();

      if(globals.hiveSaveDateBool == true){
        addResultsDB();
      }
      
    } else {

      if(globals.hiveSaveDateBool == true){
        astronautL = obtainResultsFromDb();
      }
      
    }

  }

   // add all
  addResultsDB() {

    late List<AstronautHive> listAstronautHiveAdd = [];

    for(Astronaut astronaut in listAstronautsAdd){

      late AstronautHive astronautHive = new AstronautHive()
      ..agency = astronaut.agency
      ..bio = astronaut.bio
      ..dateOfBirth = astronaut.dateOfBirth
      ..dateOfDeath = astronaut.dateOfDeath
      ..firstFlight = astronaut.firstFlight
      ..id = astronaut.id
      ..lastFlight = astronaut.lastFlight
      ..name = astronaut.name
      ..nationality = astronaut.nationality
      ..nextResults = astronaut.nextResults
      ..previousResults = astronaut.previousResults
      ..profileImage = astronaut.profileImage
      ..profileImageThumbnail = astronaut.profileImageThumbnail
      ..status = astronaut.status
      ..type = astronaut.type
      ..url = astronaut.url
      ..wiki = astronaut.wiki
      ;

      listAstronautHiveAdd.add(astronautHive);

    }

    var box = AstronautHiveBox.getAstronautBox();
    box.addAll(listAstronautHiveAdd);

  }


  deleteResultsDB() {

    var box = AstronautHiveBox.getAstronautBox();
    box.deleteAll(box.keys);

  }
  
  List<Astronaut> obtainResultsFromDb() {

    late List<AstronautHive>? astronautHiveList = [];

    var box = AstronautHiveBox.getAstronautBox();

    astronautHiveList = box.values.cast<AstronautHive>().toList();

    List<Astronaut> _listAstronauts = [];

    for(AstronautHive astronautHive in astronautHiveList){

      late Astronaut astronaut = new Astronaut(id: astronautHive.id, url: astronautHive.url, name: astronautHive.name, 
      status: astronautHive.status, type: astronautHive.type, agency: astronautHive.agency, dateOfBirth: astronautHive.dateOfBirth, 
      dateOfDeath: astronautHive.dateOfDeath, nationality: astronautHive.nationality, wiki: astronautHive.wiki, bio: astronautHive.bio, 
      profileImage: astronautHive.profileImage, profileImageThumbnail: astronautHive.profileImageThumbnail, 
      lastFlight: astronautHive.lastFlight, firstFlight: astronautHive.firstFlight, nextResults: astronautHive.nextResults, 
      previousResults: astronautHive.previousResults);

      _listAstronauts.add(astronaut);

    }

    return _listAstronauts;

  }

}

