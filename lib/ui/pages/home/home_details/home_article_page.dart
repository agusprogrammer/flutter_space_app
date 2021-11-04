import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/article/article.dart';
import 'package:flutter_space_app/services/apirest/spaceflight_news/article_service.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/card_error_status_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/article_widget/article_list.dart';
import 'package:http/http.dart' as http;

class HomeArticlePage extends StatelessWidget {
  
  ArticleService artServ = new ArticleService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
      ),
      body: 
      
        FutureBuilder<List<Article>>(
        future: artServ.fetchGetArticlesLimit(http.Client(), 50),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
            child: CardErrorStatusSpApp(
              artServ.obtainResponse().statusCode.toString(),
              artServ.obtainResponse().reasonPhrase.toString()
            )
          );
          } else if (snapshot.hasData) {
            return ArticlesList(articlesL: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        ),
        
    );
    
  }
}
