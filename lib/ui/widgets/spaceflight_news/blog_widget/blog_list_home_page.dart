import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/article/article.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/blog/blog.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/navigation_button_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/article_widget/article_card_it_not_img.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/article_widget/article_card_item.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/blog_widget/blog_card_item.dart';

class BlogsListHomePage extends StatefulWidget {
  BlogsListHomePage({Key? key, required this.blogsL})
      : super(key: key);

  final List<Blog> blogsL;

  @override
  BlogsListHomePageState createState() => BlogsListHomePageState(blogsL);

}

class BlogsListHomePageState extends State<BlogsListHomePage> {
  
  // ScrollController _scrollControllerTest = new ScrollController();
  late List<Blog> blogsL = [];

  BlogsListHomePageState(this.blogsL);

  /*
  @override
  void initState() {
    super.initState();

    _scrollControllerTest.addListener(() {

      // print('pix: $_scrollControllerTest.position.pixels');
      // print(_scrollControllerTest.position.maxScrollExtent);

      // if(_scrollControllerTest.position.pixels == _scrollControllerTest.position.maxScrollExtent){}

      var triggerFetchMoreSize = 0.8 * _scrollControllerTest.position.maxScrollExtent;

      if(_scrollControllerTest.position.pixels > triggerFetchMoreSize){

        double positionPixels = _scrollControllerTest.position.pixels;
        // double positionMax = _scrollControllerTest.position.maxScrollExtent;
        
        print('pixels $positionPixels');
        print('max pixels $triggerFetchMoreSize');
      }

    });

  }
  */

  /*
  @override
  void dispose() {
    super.dispose();
    _scrollControllerTest.dispose();
  }
  */

  @override
  Widget build(BuildContext context) {

    /*
    return Container(
      decoration: new BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
      child: ListView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        itemCount: articlesL.length,
        itemBuilder: (context, index) {
          // return Text(articlesL[index].title);
          return new ArticleCardItem(articlesL[index]);
      },
    ),
    );
    */

    /*
    return ListView(
        children: [
          Placeholder(
            fallbackHeight: 200,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: articlesL.length,
            itemBuilder: (context, index) {
              return new ArticleCardItem(articlesL[index]);
            }
          )
        ],
      );
      */

    return CustomScrollView(
      // controller: _scrollControllerTest,
      slivers: [
        SliverToBoxAdapter(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 5, top: 35, left: 10, right: 10),
              child: Text('Space App', style: TextStyle(color: Color.fromRGBO(0, 0, 204, 1.0), fontSize: 25)),
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 1, top: 5, left: 10, right: 10),
            child: new NavigationButtonSpApp('Events','events'))),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 1, top: 5, left: 10, right: 10),
            child: new NavigationButtonSpApp('ISS Reports','reports'))),
        
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(bottom: 1, top: 5, left: 10, right: 10),
            child: new NavigationButtonSpApp('Articles','articles'))),

        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          if (blogsL.length > index) {
            return new BlogCardItem(blogsL[index]);
            
          }
        }))
      ],
    );
  }

}
