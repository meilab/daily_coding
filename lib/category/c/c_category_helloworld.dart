import 'package:daily_coding/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:daily_coding/model/article_item.dart';

List<ArticleItem> buildHelloworldArticleItems(
    BuildContext context, String codePath) {
  return [
    ArticleItem(
      icon: Icons.accessibility,
      title: '你的hello world程序完整吗？',
      subtitle: 'Hello World正确的书写方式',
      keyword: 'HelloWorld',
      onTap: () {
        onArticleTap(context, "/demoDetail/full_hello_world",
            codePath + 'full_hello_world.md',
            codePath: codePath + 'full_hello_world.c');
      },
    ),
  ];
}
