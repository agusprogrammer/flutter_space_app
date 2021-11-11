import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/article/article.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/navigation_url_button_sp_app.dart';

class ArticleCardItem extends StatelessWidget{

  late Article articleItem;
  ArticleCardItem(this.articleItem);

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
                Text('Updated at:   ' + this.articleItem.updatedAt, style: TextStyle(color: Colors.grey, fontSize: 15)),

                NavigationUrlButton('More', this.articleItem.url)
              ],
            ),
          )
          
        ),
      ),
      
      
    );
  }

  /*
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      shadowColor: Colors.grey,
      child: Padding(
        padding: EdgeInsets.all(12),
        
        child: Stack(
        children: [
          Image(image: NetworkImage(this.articleItem.imageUrl.toString()), height: 240, fit: BoxFit.cover)
          
        ],
      ),
      ),
      
    );
  }
  */

}

/*
class ArticleCardItem extends StatelessWidget{
  
  late Article articleItem;

  ArticleCardItem(this.articleItem);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            height: 144.0,
            width: 500.0,
            child: Image.asset(this.articleItem.imageUrl, height: 144.0, width: 500.0),
          ),
          Padding(padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                    Text(this.articleItem.title),
                    Text(this.articleItem.newsSite),
                    Text(this.articleItem.summary),
                    Text(this.articleItem.publishedAt),
                    Text(this.articleItem.updatedAt)
                  ],
            ),
          )
        ],
      ),
    );
  }
}
*/



/*
class ArticleCardItem2 extends StatefulWidget {

  late Article articleItem;
  ArticleCardItem2(this.articleItem);

  @override
    _ArticleCardItemState createState() {
      log(articleItem.title.toString());
      return _ArticleCardItemState(this.articleItem);
    } 

}


class _ArticleCardItemState extends State<ArticleCardItem2> {

  late Article article;
  _ArticleCardItemState(this.article);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 16,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Ink.image(
                      image: AssetImage(article.imageUrl),
                      fit: BoxFit.fill)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(article.title),
                    Text(article.newsSite),
                    Text(article.summary),
                    Text(article.publishedAt),
                    Text(article.updatedAt)
                  ],
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        _moreInformation();
                      });
                    }, // ir al enlace
                    child: const Text('Go', style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0)),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _moreInformation(){}

}
*/