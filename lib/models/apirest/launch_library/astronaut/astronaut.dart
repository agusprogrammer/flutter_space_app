

import 'package:http/http.dart';

class Astronaut {
  
  final int id;
  final String url;
  final String name;
  final String status;
  final String type;
  final String agency;
  final String dateOfBirth;
  final String dateOfDeath;
  final String nationality;
  final String wiki;
  final String bio;
  final String profileImage;
  final String profileImageThumbnail;
  final String lastFlight;
  final String firstFlight;
  final String nextResults;
  final String previousResults;

  const Astronaut({required this.id, required this.url, required this.name, 
  required this.status, required this.type, required this.agency, 
  required this.dateOfBirth, required this.dateOfDeath, required this.nationality, 
  required this.wiki, required this.bio, required this.profileImage, 
  required this.profileImageThumbnail, required this.lastFlight, required this.firstFlight,
  required this.nextResults, required this.previousResults});

  
}
