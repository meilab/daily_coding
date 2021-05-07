import 'package:daily_coding/model/card_item.dart';
import 'package:flutter/material.dart';

class AnimatedListMainPageListItem extends StatelessWidget {
  final CardItem cardItem;
  final AnimationController animationController;
  final Animation<double> animation;

  AnimatedListMainPageListItem(this.cardItem,
      {Key? key, required this.animationController, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            opacity: animation,
            child: Transform(
              transform: Matrix4.translationValues(
                  100 * (1.0 - animation.value), 0.0, 0.0),
              child: GestureDetector(
                child: Container(
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, bottom: 16, left: 48),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  cardItem.title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 100, 100, 135),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    cardItem.subtitle,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 100, 100, 135),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Padding(
                          padding: const EdgeInsets.only(right: 48),
                          child: CircleAvatar(
                            child: Icon(cardItem.icon),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: cardItem.onTap,
              ),
            ),
          );
        });
  }
}
