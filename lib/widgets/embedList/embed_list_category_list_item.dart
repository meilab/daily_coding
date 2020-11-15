import 'package:flutter/material.dart';

class EmbedListCategoryArticleListItem extends StatelessWidget {
  final title;
  final subtitle;
  final icon;
  final onTap;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  EmbedListCategoryArticleListItem(
      this.title, this.subtitle, this.icon, this.onTap,
      {Key key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
              opacity: animation,
              child: Transform(
                  transform: Matrix4.translationValues(
                      100 * (1.0 - animation.value), 0.0, 0.0),
                  child: GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 24),
                            width: double.infinity,
                            constraints: BoxConstraints(minHeight: 48),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 114, 123, 225),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(
                                left: 96,
                                top: 24,
                                bottom: 24,
                                right: 24,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 8),
                                    child: Text(
                                      subtitle ?? "",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(left: 24),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Icon(
                              icon,
                              size: 48,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: onTap,
                  )));
        });
  }
}