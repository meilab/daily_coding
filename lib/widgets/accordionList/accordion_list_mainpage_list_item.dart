import 'package:daily_coding/change_notifier/content_notifier.dart';
import 'package:daily_coding/widgets/animCategoryContainer.dart';
import 'package:daily_coding/widgets/animCategoryItem.dart';
import 'package:daily_coding/model/card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccordionListMainPageListItem extends StatefulWidget {
  final CardItem cardItem;
  final AnimationController animationController;
  final Animation<double> animation;

  AccordionListMainPageListItem(this.cardItem,
      {Key? key, required this.animationController, required this.animation})
      : super(key: key);

  @override
  _AccordionListMainPageListItemState createState() =>
      _AccordionListMainPageListItemState();
}

class _AccordionListMainPageListItemState
    extends State<AccordionListMainPageListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ContentNotifier contentNotifier =
        Provider.of<ContentNotifier>(context);
    final cardList = contentNotifier.getCardList();

    return AnimatedBuilder(
        animation: widget.animationController,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
              opacity: widget.animation,
              child: Transform(
                  transform: Matrix4.translationValues(
                      100 * (1.0 - widget.animation.value), 0.0, 0.0),
                  child: GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 24),
                      child: AnimCategoryContainer(
                        CategoryBean(
                          Icons.directions_bike,
                          widget.cardItem.title,
                          cardList.map((v) {
                            return CategoryBean(
                                Icons.missed_video_call, v.title, [], v.onTap);
                          }).toList(),
                          widget.cardItem.onTap,
                        ),
                      ),
                    ),
                  )));
        });
  }
}
