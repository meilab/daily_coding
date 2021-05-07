import 'package:daily_coding/pages/feed/feedmainpage.dart';
import 'package:daily_coding/model/card_item.dart';
import 'package:flutter/material.dart';

import 'embed_list_mainpage_list_item.dart';

class EmbedListMainPage extends StatefulWidget {
  final String title;
  final List<CardItem> categoryList;
  EmbedListMainPage(this.categoryList, {this.title = ""});

  @override
  _EmbedListMainPageState createState() => _EmbedListMainPageState();
}

class _EmbedListMainPageState extends State<EmbedListMainPage>
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
    final int len = widget.categoryList.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFF736AB7),
        actions: [
          IconButton(
            icon: Icon(
              Icons.rss_feed,
              color: Colors.white,
            ),
            color: Colors.black54,
            tooltip: "掘金文章",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FeedMainPage(title: widget.title)));
            },
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFF736AB7),
        child: ListView.builder(
          itemBuilder: (context, index) {
            final int count = len > 10 ? 10 : len;
            final Animation<double> animation =
                Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationController,
                    curve: Interval((1 / count) * index, 1.0,
                        curve: Curves.fastOutSlowIn)));
            animationController.forward();

            var itemCategory = widget.categoryList[index];
            return EmbedListMainPageListItem(
              itemCategory.title,
              itemCategory.subtitle,
              itemCategory.imgUrl,
              itemCategory.onTap,
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
