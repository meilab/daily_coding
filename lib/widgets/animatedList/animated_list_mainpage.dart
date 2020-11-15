import 'package:daily_coding/model/card_item.dart';
import 'package:flutter/material.dart';

import 'animated_list_mainpage_list_item.dart';

class AnimatedListMainPage extends StatefulWidget {
  final String title;
  final List<CardItem> categoryList;
  AnimatedListMainPage(this.categoryList, {this.title = ''});

  @override
  _AnimatedListMainPageState createState() => _AnimatedListMainPageState();
}

class _AnimatedListMainPageState extends State<AnimatedListMainPage>
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
    final int len = widget.categoryList.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Color.fromARGB(255, 239, 239, 239),
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
            return AnimatedListMainPageListItem(
              itemCategory,
              animation: animation,
              animationController: animationController,
            );
          },
          itemCount: widget.categoryList.length,
        ),
      ),
    );
  }
}
