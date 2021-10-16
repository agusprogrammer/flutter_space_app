import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/article/article.dart';

class ArticleCardItemNotImg extends StatelessWidget{

  late Article articleItem;
  ArticleCardItemNotImg(this.articleItem);

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
                
                Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 5),
                  child: Text(this.articleItem.title, style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 22)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(this.articleItem.summary, style: TextStyle(color: Colors.black, fontSize: 20)),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('News site: ' + this.articleItem.newsSite, style: TextStyle(color: Colors.grey, fontSize: 15)),
                ),

                Text('Published at: ' + this.articleItem.publishedAt, style: TextStyle(color: Colors.grey, fontSize: 15)),
                Text('Updated at:    ' + this.articleItem.updatedAt, style: TextStyle(color: Colors.grey, fontSize: 15))
              ],
            ),
          )
          
        ),
      ),
      
      
    );
  }

}