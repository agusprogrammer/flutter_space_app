import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/launch_library/launcher/launcher.dart';
import 'package:flutter_space_app/models/apirest/launch_library/spacecraft/spacecraft.dart';
import 'package:flutter_space_app/services/apirest/launch_library/launcher_service.dart';
import 'package:flutter_space_app/services/apirest/launch_library/spacecraft_service.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/card_error_status_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/navigation_button_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/launcher_widget/launcher_list.dart';
import 'package:flutter_space_app/ui/widgets/launch_library/spacecraft_widget/spacecraft_list.dart';
import 'package:http/http.dart' as http;
import '/globals.Dart' as globals;

class LaunchersPage extends StatelessWidget {
  
  LauncherService launcherService = new LauncherService();

  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder<List<Launcher>>(
        future: launcherService.fetchLauncherList(http.Client(), 30),
        builder: (context, snapshot) {
          if (snapshot.hasError) {

            if(globals.hiveShowHtmlErrorsBool == true){
              return CardErrorStatusSpApp(
                      launcherService.obtainResponse().statusCode.toString(),
                      launcherService.obtainResponse().reasonPhrase.toString());
              
            } else {

              late List<Launcher> launcherList = [];
              return LauncherList(launcherL: launcherList, saveData: false);
              

            }

          } else if (snapshot.hasData) {
            return LauncherList(launcherL: snapshot.data!, saveData: true);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
