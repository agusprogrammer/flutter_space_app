import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/article/article.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/article_widget/article_card_item.dart';

class ArticlesList extends StatelessWidget {
  const ArticlesList({Key? key, required this.articlesL}) : super(key: key);

  final List<Article> articlesL;
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: new BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
      child: ListView.builder(
      itemCount: articlesL.length,
      itemBuilder: (context, index) {
        return new ArticleCardItem(articlesL[index]);
      },
    ),
    );
    
  }
}


