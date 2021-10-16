import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationUrlButton extends StatefulWidget {
  
  late String titleButton;
  late String urlButton;

  NavigationUrlButton(this.titleButton, this.urlButton);

  @override
  State<NavigationUrlButton> createState() => _NavigationUrlButtonState(this.titleButton, this.urlButton);

}

class _NavigationUrlButtonState extends State<NavigationUrlButton> {
  
  late String titleButton = '';
  late String urlButton = '';

  _NavigationUrlButtonState(this.titleButton, this.urlButton);

  final TextStyle textStyle = new TextStyle(
    color: Color.fromRGBO(0, 0, 204, 1.0),
    fontSize: 16.0
  );

  @override
  Widget build(BuildContext context) {
    return Center(child: TextButton(
      child: Text(this.titleButton, style: textStyle),
      onPressed: () {
        try{
          _launchURL();
        }catch(e){
          Fluttertoast.showToast(msg: 'url error', toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
        }
      }));
    
  }

  _launchURL() async{
    if (await canLaunch(urlButton )) {
      await launch(urlButton);
    } else {
      throw 'Could not launch $urlButton';

      /*
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ToastContext(),
      ));
      */

    }
  }
  
}

