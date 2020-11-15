import 'package:daily_coding/utils/utils.dart';
import 'package:daily_coding/model/article_item.dart';
import 'package:flutter/material.dart';

import 'flutter_category_dummy.dart';

List<ArticleCategoryInfo> flutterCategoryList = [
  ArticleCategoryInfo(
    name: "敬请期待",
    subName: '教程准备中',
    icon: 'assets/images/opacity.png',
    articleFolder: 'lib/category/flutter/dummy/',
    buildFunc: buildDummyArticleItems,
  ),
];

List<ArticleItemCategory> buildFlutterCategoryList(BuildContext context) =>
    flutterCategoryList.map((item) {
      return buildCategoryCard(context, item, '');
    }).toList();
