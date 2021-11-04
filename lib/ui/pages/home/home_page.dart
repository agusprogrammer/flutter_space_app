import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/article/article.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/blog/blog.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/report/report.dart';
import 'package:flutter_space_app/services/apirest/spaceflight_news/article_service.dart';
import 'package:flutter_space_app/services/apirest/spaceflight_news/blog_service.dart';
import 'package:flutter_space_app/services/apirest/spaceflight_news/report_service.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/card_error_status_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/navigation_button_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/article_widget/article_list.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/blog_widget/blog_list_home_page.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/blog_widget/blog_list.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/blog_widget/blog_list_blocked.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/report_widget/report_list.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/report_widget/report_list_blocked.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BlogService blogServ = new BlogService();

  Widget build(BuildContext context) {
    return FutureBuilder<List<Blog>>(
        future: blogServ.fetchGetBlogsLimit(http.Client(), 50),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: 5, top: 35, left: 10, right: 10),
                    child: Text('Space App',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 204, 1.0),
                            fontSize: 25)),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 1, top: 5, left: 10, right: 10),
                      child: new NavigationButtonSpApp('Events', 'events'))),
              SliverToBoxAdapter(
                  child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 1, top: 5, left: 10, right: 10),
                      child:
                          new NavigationButtonSpApp('ISS Reports', 'reports'))),
              SliverToBoxAdapter(
                  child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 1, top: 5, left: 10, right: 10),
                      child:
                          new NavigationButtonSpApp('Articles', 'articles'))),
              SliverToBoxAdapter(
                  child: Center(
                      child: CardErrorStatusSpApp(
                          blogServ.obtainResponse().statusCode.toString(),
                          blogServ.obtainResponse().reasonPhrase.toString())))
            ]);
          } else if (snapshot.hasData) {
            return BlogsListHomePage(blogsL: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }


}
