

import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/space_agency/space_agency.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/space_agency_widget/space_agency_carditem.dart';

class SpaceAgencyList extends StatelessWidget {
  
  const SpaceAgencyList({Key? key, required this.spaceAgencyL}) : super(key: key);

  final List<SpaceAgency> spaceAgencyL;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
      child: ListView.builder(
        itemCount: spaceAgencyL.length,
        itemBuilder: (context, index) {
          return new SpaceAgencyCardItem(spaceAgencyL[index]);
        },
      )
    );
  }
  
}

