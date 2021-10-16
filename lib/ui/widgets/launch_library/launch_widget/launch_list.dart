import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launch/launch.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/launch_widget/launch_carditem.dart';

class LaunchList extends StatefulWidget {
  
  const LaunchList({Key? key, required this.launchL}) : super(key: key); 

  final List<Launch> launchL;

  @override
  _LaunchList createState() => _LaunchList(launchL);

}

class _LaunchList extends State<LaunchList> {
  
  final List<Launch> launchL;
  _LaunchList(this.launchL);

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
      slivers: [
        SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5, top: 35, left: 10, right: 10),
              child: Text('Launches', style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 25)),
            ),
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          if (launchL.length > index) {
            return new LaunchCardItem(launchL[index]);
            
          }
        }))
      ]
    );
  }
  
}
