
import 'package:http/http.dart';

class Spacecraft {
  final int id;
  final String url;
  final String name;
  final String serialNumber;
  final String status;
  final String description;
  final String spcConfName;
  final String spcConfType;
  final String agencyName;
  final String agencyType;
  final String inUse;
  final String imageUrl;

  final String nextResults;
  final String previousResults;

  const Spacecraft({required this.id,required this.url,required this.name,
  required this.serialNumber,required this.status,required this.description,
  required this.spcConfName,required this.spcConfType,required this.agencyName,
  required this.agencyType,required this.inUse,required this.imageUrl,
  required this.nextResults, required this.previousResults});

}

