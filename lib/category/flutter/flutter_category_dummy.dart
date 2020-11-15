import 'package:daily_coding/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:daily_coding/model/article_item.dart';

List<ArticleItem> buildDummyArticleItems(
    BuildContext context, String codePath) {
  return [
    ArticleItem(
      icon: Icons.accessibility,
      title: '教程准备中',
      subtitle: '教程准备中',
      keyword: 'HelloWorld',
      onTap: () async {
        onArticleTap(context, "/demoDetail/教程准备中", 'assets/md/coming.md');
      },
    ),
  ];
}
