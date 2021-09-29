import 'package:flutter/material.dart';
import 'package:flutter_space_app/models/apirest/spaceflight_news/blog/blog.dart';
import 'package:flutter_space_app/ui/widgets/spaceflight_news/blog_widget/blog_card_item.dart';

class BlogList extends StatelessWidget {
  
  const BlogList({Key? key, required this.blogsL}) : super(key: key);

  final List<Blog> blogsL;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Color.fromRGBO(220, 220, 220, 1.0)),
      child: ListView.builder(
        itemCount: blogsL.length,
        itemBuilder: (context, index) {
          return new BlogCardItem(blogsL[index]);
        },
      ),
    );
    
  }

}






