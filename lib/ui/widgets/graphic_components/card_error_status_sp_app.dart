import 'package:flutter/material.dart';

// Card for show the http error on screen.
class CardErrorStatusSpApp extends StatelessWidget {
  late String errorCode;
  late String messageCode;

  CardErrorStatusSpApp(this.errorCode, this.messageCode);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.only(bottom: 15, top: 10, left: 15, right: 15),
            child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 5,
                shadowColor: Colors.black,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Table(
                    children: [
                      TableRow(
                        children: [
                          Row(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(bottom: 10, top: 5),
                                  child: Text('Error:   ',
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 204, 1.0),
                                          fontSize: 21)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10, top: 5),
                                  child: Text(this.errorCode,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 21)),
                                ),
                            ],
                          )
                        ]
                      ),
                      TableRow(
                        children: [
                          Padding( padding: EdgeInsets.only(bottom: 10),
                            child: Text(this.messageCode,
                              style: TextStyle(
                              color: Colors.black, fontSize: 20)),
                          ),
                        ]
                      )
                    ],
                  ),

                )
              )
            )
          );
  }
}
