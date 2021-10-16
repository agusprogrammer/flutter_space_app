import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launch/launch.dart';
import 'package:flutter_space_app/services/apirest/launch_library/launch_service.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/card_error_status_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/launch_widget/launch_list.dart';
import 'package:http/http.dart' as http;

class LaunchPage extends StatelessWidget{

  LaunchService launchService = new LaunchService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Launch>>(
      future: launchService.fetchGetLaunchList(http.Client(), 2),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: CardErrorStatusSpApp(
              launchService.obtainResponse().statusCode.toString(),
              launchService.obtainResponse().reasonPhrase.toString()
            )
          );
        } else if (snapshot.hasData) {
          return LaunchList(launchL: snapshot.data!);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      });
    
  }

}