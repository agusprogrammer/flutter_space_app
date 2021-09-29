import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/article/article.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/blog/blog.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/report/report.dart';
import 'package:flutter_space_app/services/apirest/spaceflight_news/article_service.dart';
import 'package:flutter_space_app/services/apirest/spaceflight_news/blog_service.dart';
import 'package:flutter_space_app/services/apirest/spaceflight_news/report_service.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/article_widget/article_list.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/blog_widget/blog_list.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/report_widget/report_list.dart';
import 'package:http/http.dart' as http;


class Home extends StatelessWidget{
  
  /*
  ArticleService artServ = new ArticleService();

  Widget build(BuildContext context) {
    return FutureBuilder<List<Article>>(
      future: artServ.fetchGetArticlesLimit(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return ArticlesList(articlesL: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      },
    );
  }
  */
  
  

  /*
  BlogService blogServ = new BlogService();

  Widget build(BuildContext context) {
    return FutureBuilder<List<Blog>>(
      future: blogServ.fetchGetBlogsLimit(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return BlogList(blogsL: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      },
    );
  }
  */

  ReportService reportServ = new ReportService();

   Widget build(BuildContext context) {
     return FutureBuilder<List<Report>>(
       future: reportServ.fetchGetReportsLimit(http.Client()),
       builder: (context, snapshot) {
         if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return ReportList(reportL: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
       },
     );
   }
  

}

