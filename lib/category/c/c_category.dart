import 'package:daily_coding/utils/utils.dart';
import 'package:daily_coding/model/article_item.dart';
import 'package:flutter/widgets.dart';

import 'c_category_helloworld.dart';
import 'c_category_pointer.dart';
import 'c_category_trap.dart';

List<ArticleCategoryInfo> helloWorldList = [
  ArticleCategoryInfo(
    name: "Hello World",
    subName: 'Do you realy know Hello World',
    icon: 'assets/images/stack.png',
    articleFolder: 'lib/category/c/helloworld/',
    buildFunc: buildHelloworldArticleItems,
  ),
  ArticleCategoryInfo(
    name: "C陷阱",
    subName: 'C语言中易错知识点',
    icon: 'assets/images/stack.png',
    articleFolder: 'lib/category/c/traps/',
    buildFunc: buildTrapArticleItems,
  ),
  ArticleCategoryInfo(
    name: "指针和数组",
    subName: 'C语言的精华，也是最难用好的部分',
    icon: 'assets/images/opacity.png',
    articleFolder: 'lib/category/c/pointer/',
    buildFunc: buildPointerArticleItems,
  ),
];

List<ArticleItemCategory> buildClangCategoryList(BuildContext context) =>
    helloWorldList.map((item) {
      return buildCategoryCard(context, item, '/clangCategoryContainer');
    }).toList();
