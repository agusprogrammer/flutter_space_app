
import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/spacecraft/spacecraft.dart';
import 'package:flutter_space_app/models/hive_database/launch_library/spacecraft/spacecraft_hive.dart';
import 'package:flutter_space_app/services/apirest/launch_library/spacecraft_service.dart';
import 'package:flutter_space_app/services/hive_db_boxes/spacecraft_hive_box.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/spacecraft_widget/spacecraft_carditem.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '/globals.Dart' as globals;

class SpacecraftList extends StatefulWidget{

  SpacecraftList({Key? key, required this.spacecraftL, required this.saveData}) : super(key: key);

  late List<Spacecraft> spacecraftL;
  late bool saveData; 

  @override
  _SpacecraftListState createState() => _SpacecraftListState(spacecraftL, saveData);

}

class _SpacecraftListState extends State<SpacecraftList>{
  
  SpacecraftService spacecraftService = new SpacecraftService();

  ScrollController _scrollController = new ScrollController();

  late List<Spacecraft> spacecraftL;
  late bool saveData; 

  _SpacecraftListState(this.spacecraftL, this.saveData);

  late List<Spacecraft> listSpacecraftAdd = [];

   @override
  initState() {
    super.initState();

    dataRefresh();
    
    _scrollController.addListener(() {
      
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){

        double positionMax90 = 0.9 * _scrollController.position.maxScrollExtent;

        fetchGetSpacecraftListNextResults(positionMax90);
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
              child: Text('Spacecraft', style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 25)),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
          (context, index) {
          
            if (spacecraftL.length > index) {
              return new SpacecraftCardItem(spacecraftL[index]); 
            }
            
          }),
        ),
      ]);
  }

  dataRefresh(){
    
    if(saveData == true){

      listSpacecraftAdd.addAll(spacecraftL);

      deleteResultsDB();

      if(globals.hiveSaveDateBool == true){
        addResultsDB();
      }
      
    } else {

      if(globals.hiveSaveDateBool == true){
        spacecraftL = obtainResultsFromDb();
      }
      
    }
  }

  fetchGetSpacecraftListNextResults(double positionMax90) async {

    Response _response = new Response('', 404);
    late bool errorResponseBool = true;
    late List<Spacecraft> _spacecraftLNextResults = [];

    try{

      _response = await http.Client().get(Uri.parse(spacecraftL.last.nextResults));
      errorResponseBool = false;

    }catch(e){
      errorResponseBool = true;
    }

    if(errorResponseBool == false){

      if(_response.statusCode >= 200 && _response.statusCode < 300) {

        _spacecraftLNextResults.addAll(spacecraftService.parseSpacecraftList(_response));

        spacecraftL.addAll(_spacecraftLNextResults);

        if(saveData == true){

          listSpacecraftAdd.clear();
          listSpacecraftAdd.addAll(_spacecraftLNextResults);

          _scrollController.jumpTo(positionMax90);

        }

      }

    }

  }

  // add all
  addResultsDB() {

    late List<SpacecraftHive> listSpacecraftHiveAdd = [];

    for(Spacecraft spacecraft in listSpacecraftAdd){

      late SpacecraftHive spacecraftHive = new SpacecraftHive()
      ..agencyName = spacecraft.agencyName
      ..agencyType = spacecraft.agencyType
      ..description = spacecraft.description
      ..id = spacecraft.id
      ..imageUrl = spacecraft.imageUrl
      ..inUse = spacecraft.inUse
      ..name = spacecraft.name
      ..nextResults = spacecraft.nextResults
      ..previousResults = spacecraft.previousResults
      ..serialNumber = spacecraft.serialNumber
      ..spcConfName = spacecraft.spcConfName
      ..spcConfType = spacecraft.spcConfType
      ..status = spacecraft.status
      ..url = spacecraft.url
      ;

      listSpacecraftHiveAdd.add(spacecraftHive);

    }

    var box = SpacecraftHiveBox.getSpacecraftBox();
    box.addAll(listSpacecraftHiveAdd);

  }

  deleteResultsDB() {
    var box = SpacecraftHiveBox.getSpacecraftBox();
    box.deleteAll(box.keys);
  }

  List<Spacecraft> obtainResultsFromDb() {

    late List<SpacecraftHive>? spacecraftHiveList = [];

    var box = SpacecraftHiveBox.getSpacecraftBox();
    spacecraftHiveList = box.values.cast<SpacecraftHive>().toList();

    List<Spacecraft> _listSpacecraft = [];

    for(SpacecraftHive spacecraftHive in spacecraftHiveList){

      late Spacecraft spacecraft = new Spacecraft(id: spacecraftHive.id, url: spacecraftHive.url, name: spacecraftHive.name, 
      serialNumber: spacecraftHive.serialNumber, status: spacecraftHive.status, description: spacecraftHive.description, 
      spcConfName: spacecraftHive.spcConfName, spcConfType: spacecraftHive.spcConfType, agencyName: spacecraftHive.agencyName, 
      agencyType: spacecraftHive.agencyType, inUse: spacecraftHive.inUse, imageUrl: spacecraftHive.imageUrl, 
      nextResults: spacecraftHive.nextResults, previousResults: spacecraftHive.previousResults);

      _listSpacecraft.add(spacecraft);
    }

    return _listSpacecraft; 

  }

}
