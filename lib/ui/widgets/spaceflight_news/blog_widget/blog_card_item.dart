import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/blog/blog.dart';

class BlogCardItem extends StatelessWidget{

  late Blog blogItem;
  BlogCardItem(this.blogItem);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(bottom: 15, top: 10, left: 15, right: 15),
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 5,
          shadowColor: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                //Image(image: NetworkImage(this.blogItem.imageUrl), height: 240, fit: BoxFit.cover),
                 
                Ink(
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(20.0)),
                    image: DecorationImage(
                      image: NetworkImage(this.blogItem.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 5),
                  child: Text(this.blogItem.title, style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 22)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.blogItem.summary, style: TextStyle(color: Colors.black, fontSize: 20)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('News site: ' + this.blogItem.newsSite, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Text('Published at: ' + this.blogItem.publishedAt, style: TextStyle(color: Colors.grey, fontSize: 15)),
              ],
            ),
          )
          
        ),
      ),
      
      
    );
  }
}