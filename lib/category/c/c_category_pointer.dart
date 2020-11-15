import 'package:daily_coding/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:daily_coding/model/article_item.dart';

List<ArticleItem> buildPointerArticleItems(
    BuildContext context, String codePath) {
  return [
    ArticleItem(
      icon: Icons.accessibility,
      title: '指针和数组',
      subtitle: '指针和数组',
      keyword: 'pointer_and_array',
      onTap: () {
        onArticleTap(
            context, "/demoDetail/指针和数组", codePath + 'pointer_and_array.md',
            codePath: codePath + 'pointer_and_array.c');
      },
    ),
    ArticleItem(
      icon: Icons.accessibility,
      title: '数组和指针的不同',
      subtitle: '数组和指针的不同',
      keyword: 'diff_of_pointer_and_array',
      onTap: () {
        onArticleTap(context, "/demoDetail/数组和指针的不同",
            codePath + 'diff_of_pointer_and_array.md',
            codePath: codePath + 'diff_of_pointer_and_array.c');
      },
    ),
    ArticleItem(
      icon: Icons.accessibility,
      title: '数组和指针相同的情况',
      subtitle: '数组和指针相同的情况',
      keyword: 'same_of_pointer_and_array',
      onTap: () {
        onArticleTap(context, "/demoDetail/数组和指针相同的情况",
            codePath + 'same_of_pointer_and_array.md',
            codePath: codePath + 'same_of_pointer_and_array.c');
      },
    ),
    ArticleItem(
      icon: Icons.accessibility,
      title: '举个例子',
      subtitle: '举个例子',
      keyword: 'one_example_of_pointer_and_array',
      onTap: () {
        onArticleTap(context, "/demoDetail/举个例子",
            codePath + 'one_example_of_pointer_and_array.md',
            codePath: codePath + 'one_example_of_pointer_and_array.c');
      },
    ),
    ArticleItem(
      icon: Icons.accessibility,
      title: '指针操作容易犯的一个错误',
      subtitle: '指针操作容易犯的一个错误',
      keyword: 'common_pointer_issue',
      onTap: () {
        onArticleTap(context, "/demoDetail/指针操作容易犯的一个错误",
            codePath + 'common_pointer_issue.md',
            codePath: codePath + 'common_pointer_issue.c');
      },
    ),
  ];
}
