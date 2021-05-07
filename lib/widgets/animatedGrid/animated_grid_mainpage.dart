import 'package:daily_coding/pages/feed/feedmainpage.dart';
import 'package:daily_coding/utils/utils.dart';
import 'package:daily_coding/model/card_item.dart';
import 'package:flutter/material.dart';

import 'animated_grid_mainpage_list_item.dart';

class AnimatedGridMainPage extends StatefulWidget {
  final String title;
  final List<CardItem> cardList;
  AnimatedGridMainPage(this.cardList, {this.title = ''});

  @override
  _AnimatedGridMainPageState createState() => _AnimatedGridMainPageState();
}

class _AnimatedGridMainPageState extends State<AnimatedGridMainPage>
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
    final int len = widget.cardList.length;
    int count = 2;

    int calcCount() {
      final contentWidth = MediaQuery.of(context).size.width;
      if (isDesktop) {
        if (contentWidth > 800) {
          count = 3;
        } else if (contentWidth > 400) {
          count = 2;
        } else {
          count = 1;
        }
      } else {
        count = 1;
      }
      return count;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF736AB7),
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
      body: Container(
          color: Color(0xFF736AB7),
          child: GridView(
            padding: const EdgeInsets.all(8),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: List<Widget>.generate(
              len,
              (int index) {
                final int count = len;
                final Animation<double> animation =
                    Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                    parent: animationController,
                    curve: Interval((1 / count) * index, 1.0,
                        curve: Curves.fastOutSlowIn),
                  ),
                );
                animationController.forward();

                var itemCategory = widget.cardList[index];
                return AnimatedGridMainPageListItem(
                  itemCategory,
                  animation: animation,
                  animationController: animationController,
                );
              },
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: calcCount(),
              mainAxisSpacing: 32.0,
              crossAxisSpacing: 32.0,
              childAspectRatio: 0.8,
            ),
          )),
    );
  }
}
