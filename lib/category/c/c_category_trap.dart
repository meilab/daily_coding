import 'package:daily_coding/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:daily_coding/model/article_item.dart';

List<ArticleItem> buildTrapArticleItems(BuildContext context, String codePath) {
  return [
    ArticleItem(
      icon: Icons.format_bold,
      title: '比较与赋值',
      subtitle: '比较与赋值',
      keyword: 'first_trap',
      onTap: () {
        onArticleTap(context, "/demoDetail/比较与赋值", codePath + 'first_trap.md',
            codePath: codePath + 'first_trap.c');
      },
    ),
    ArticleItem(
      icon: Icons.format_bold,
      title: '整型常量',
      subtitle: '整型常量',
      keyword: 'int_octal',
      onTap: () {
        onArticleTap(context, "/demoDetail/整型常量", codePath + 'int_octal.md',
            codePath: codePath + 'int_octal.c');
      },
    ),
    ArticleItem(
      icon: Icons.format_bold,
      title: '字符与字符串的差别',
      subtitle: '字符与字符串的差别',
      keyword: 'char_and_string',
      onTap: () {
        onArticleTap(
            context, "/demoDetail/字符与字符串的差别", codePath + 'char_and_string.md',
            codePath: codePath + 'char_and_string.c');
      },
    ),
    ArticleItem(
      icon: Icons.format_bold,
      title: '优先级',
      subtitle: '优先级',
      keyword: 'priority',
      onTap: () {
        onArticleTap(context, "/demoDetail/优先级", codePath + 'priority.md',
            codePath: codePath + 'priority.c');
      },
    ),
    ArticleItem(
      icon: Icons.format_bold,
      title: '注意分号',
      subtitle: '注意分号',
      keyword: 'semicolon',
      onTap: () {
        onArticleTap(context, "/demoDetail/注意分号", codePath + 'semicolon.md',
            codePath: codePath + 'semicolon.c');
      },
    ),
    ArticleItem(
      icon: Icons.format_bold,
      title: '为了编译器设计者方便，而不是开发者方便',
      subtitle: '为了编译器设计者方便，而不是开发者方便',
      keyword: 'wired_thing',
      onTap: () {
        onArticleTap(context, "/demoDetail/C语言的很多特性是为了编译器设计者方便，而不是开发者方便",
            codePath + 'wired_thing.md',
            codePath: codePath + 'wired_thing.c');
      },
    ),
    ArticleItem(
      icon: Icons.format_bold,
      title: '你真的懂const吗',
      subtitle: '你真的懂const吗',
      keyword: 'const',
      onTap: () {
        onArticleTap(context, "/demoDetail/你真的懂const吗", codePath + 'const.md',
            codePath: codePath + 'const.c');
      },
    ),
    ArticleItem(
      icon: Icons.format_bold,
      title: ' Switch的问题',
      subtitle: ' Switch的问题',
      keyword: 'switch_problem',
      onTap: () {
        onArticleTap(
            context, "/demoDetail/Switch的问题", codePath + 'switch_problem.md',
            codePath: codePath + 'switch_problem.c');
      },
    ),
    ArticleItem(
      icon: Icons.format_bold,
      title: ' 小心陷阱',
      subtitle: ' 小心陷阱',
      keyword: 'wired_trap',
      onTap: () {
        onArticleTap(context, "/demoDetail/小心陷阱", codePath + 'wired_trap.md',
            codePath: codePath + 'wired_trap.c');
      },
    ),
    ArticleItem(
      icon: Icons.format_bold,
      title: ' 悬挂else引发的问题',
      subtitle: ' 悬挂else引发的问题',
      keyword: 'else_trap',
      onTap: () {
        onArticleTap(
            context, "/demoDetail/悬挂else引发的问题", codePath + 'else_trap.md',
            codePath: codePath + 'else_trap.c');
      },
    ),
  ];
}
