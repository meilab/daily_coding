import 'package:daily_coding/model/article_item.dart';
import 'package:flutter/material.dart';

class SearchPageListItem extends StatelessWidget {
  final ArticleItem articleItem;

  SearchPageListItem(this.articleItem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(4),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 16,
                  left: 16,
                  bottom: 30,
                ),
                child: CircleAvatar(
                  child: Icon(articleItem.icon),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 16),
                      child: Text(
                        articleItem.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 100, 100, 135),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8,
                        left: 16,
                        right: 16,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.forward,
                            color: Color.fromARGB(255, 100, 100, 135),
                          ),
                          Expanded(
                            child: Text(
                              articleItem.subtitle,
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 100, 100, 135),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: articleItem.onTap,
    );
  }
}
