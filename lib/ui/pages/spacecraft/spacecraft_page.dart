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

class SpacecraftPage extends StatelessWidget {
  // SpacecraftService _spacecraftService = new SpacecraftService();

  LauncherService launcherService = new LauncherService();

  @override
  Widget build(BuildContext context) {
    /*
    return Container(
      child:  Text('launch'),
    );
    */

    /*
    return FutureBuilder<List<Spacecraft>>(
      future: _spacecraftService.fetchGetSpacecraftList(http.Client(), 20),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return SpacecraftList(spacecraftL: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      }
    );
    */

    return FutureBuilder<List<Launcher>>(
        future: launcherService.fetchLauncherList(http.Client(), 2),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 5, top: 35, left: 10, right: 10),
                      child: Text('Space Launchers',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 0, 204, 1.0),
                              fontSize: 25)),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.only( bottom: 1, top: 5, left: 10, right: 10),
                        child: new NavigationButtonSpApp('Spacecraft', 'spacecraft'))),
                SliverToBoxAdapter(
                  child: CardErrorStatusSpApp(
                      launcherService.obtainResponse().statusCode.toString(),
                      launcherService.obtainResponse().reasonPhrase.toString()),
                )
              ],
            );
          } else if (snapshot.hasData) {
            return LauncherList(launcherL: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
