import 'package:daily_coding/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:daily_coding/model/article_item.dart';

List<ArticleItem> buildTheoryArticleItems(
    BuildContext context, String codePath) {
  return [
    ArticleItem(
      icon: Icons.accessibility,
      title: '相关能量分析',
      subtitle: '相关能量分析',
      keyword: 'cpa',
      onTap: () {
        onArticleTap(context, "/demoDetail/相关能量分析", codePath + 'cpa.md',
            codePath: codePath + 'cpa.py');
      },
    ),
  ];
}
