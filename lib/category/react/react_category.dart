import 'package:daily_coding/utils/utils.dart';
import 'package:daily_coding/model/article_item.dart';
import 'package:flutter/material.dart';

import 'react_category_dummy.dart';

List<ArticleCategoryInfo> reactCategoryList = [
  ArticleCategoryInfo(
    name: "敬请期待",
    subName: '教程准备中',
    icon: 'assets/images/opacity.png',
    articleFolder: 'lib/category/react/dummy/',
    buildFunc: buildDummyArticleItems,
  ),
];

List<ArticleItemCategory> buildReactCategoryList(BuildContext context) =>
    reactCategoryList.map((item) {
      return buildCategoryCard(context, item, '/reactCategoryContainer');
    }).toList();
