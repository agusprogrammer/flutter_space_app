import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/article/article.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/blog/blog.dart';
import 'package:flutter_space_app/ui/widgets/graphic_components/navigation_button_sp_app.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/article_widget/article_card_it_not_img.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/article_widget/article_card_item.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/blog_widget/blog_card_item.dart';

class BlogsListHomePage extends StatelessWidget {
  const BlogsListHomePage({Key? key, required this.blogsL})
      : super(key: key);

  final List<Blog> blogsL;


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
