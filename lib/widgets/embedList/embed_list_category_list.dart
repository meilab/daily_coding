import 'package:daily_coding/model/card_item.dart';
import 'package:flutter/material.dart';

import 'embed_list_category_list_item.dart';

class EmbedListCategoryList extends StatefulWidget {
  final List<CardItem> cardList;
  final String name;

  EmbedListCategoryList(this.cardList, this.name);

  @override
  _EmbedListCategoryListState createState() => _EmbedListCategoryListState();
}

class _EmbedListCategoryListState extends State<EmbedListCategoryList>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final len = widget.cardList.length;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Color.fromARGB(255, 54, 55, 70),
        elevation: 0,
      ),
      body: Container(
        color: Color.fromARGB(255, 54, 55, 70),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final int count = len > 10 ? 10 : len;
            final Animation<double> animation =
                Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationController,
                    curve: Interval((1 / count) * index, 1.0,
                        curve: Curves.fastOutSlowIn)));
            animationController.forward();

            var article = widget.cardList[index];
            return EmbedListCategoryArticleListItem(
              article.title,
              article.subtitle,
              article.icon,
              article.onTap,
              animation: animation,
              animationController: animationController,
            );
          },
          itemCount: len,
        ),
      ),
    );
  }
}
