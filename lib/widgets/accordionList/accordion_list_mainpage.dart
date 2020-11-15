import 'package:daily_coding/change_notifier/content_notifier.dart';
import 'package:daily_coding/pages/feed/feedmainpage.dart';
import 'package:daily_coding/utils/utils.dart';
import 'package:daily_coding/model/card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'accordion_list_mainpage_list_item.dart';

class AccordionListMainPage extends StatefulWidget {
  final String title;
  final List<CardItem> cardList;
  AccordionListMainPage(this.cardList, {this.title = ''});

  @override
  _AccordionListMainPageState createState() => _AccordionListMainPageState();
}

class _AccordionListMainPageState extends State<AccordionListMainPage>
    with TickerProviderStateMixin {
  AnimationController animationController;

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
    final int len = widget.cardList.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00BCD4),
        elevation: 0,
        title: Text(widget.title),
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
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xFF00BCD4),
            child: ListView.builder(
              itemBuilder: (context, index) {
                final int count = len > 10 ? 10 : len;
                final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animationController,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn)));
                animationController.forward();

                var itemCategory = widget.cardList[index];
                return AccordionListMainPageListItem(
                  itemCategory,
                  animation: animation,
                  animationController: animationController,
                );
              },
              itemCount: len,
            ),
          ),
        ],
      ),
    );
  }
}
