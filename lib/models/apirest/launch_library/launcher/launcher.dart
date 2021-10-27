
import 'package:http/http.dart';

class Launcher {
  final int id;
  final String url;
  final String flightProven;
  final String serialNumber;
  final String status;
  final String details;
  final int launchConfId;
  final String launchConfUrl;
  final String launchConfName;
  final String launchConfFamily;
  final String launchConfFullName;
  final String launchConfVariant;
  final String imageUrl;
  final String flights;
  final String lastLaunchDate;
  final String firstLaunchDate;
  
  final String nextResults;
  final String previousResults;

  Launcher({required this.id,required this.url, required this.flightProven, required this.serialNumber, 
  required this.status, required this.details, required this.launchConfId, required this.launchConfUrl, 
  required this.launchConfName, required this.launchConfFamily, required this.launchConfFullName, 
  required this.launchConfVariant, required this.imageUrl, required this.flights, required this.lastLaunchDate, 
  required this.firstLaunchDate, required this.nextResults, required this.previousResults});

}
