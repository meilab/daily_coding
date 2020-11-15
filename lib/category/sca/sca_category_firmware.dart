import 'package:daily_coding/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:daily_coding/model/article_item.dart';

List<ArticleItem> buildFirmwareArticleItems(
    BuildContext context, String codePath) {
  return [
    ArticleItem(
      icon: Icons.accessibility,
      title: '目标板固件编译',
      subtitle: '目标板固件编译',
      keyword: 'firmware_build',
      onTap: () {
        onArticleTap(
            context, "/demoDetail/目标板固件编译", codePath + 'firmware_build.md',
            codePath: codePath + 'firmware_build.py');
      },
    ),
    ArticleItem(
      icon: Icons.accessibility,
      title: '目标板固件架构理解和修改',
      subtitle: '目标板固件架构理解和修改',
      keyword: 'firmware_arch',
      onTap: () {
        onArticleTap(
            context, "/demoDetail/目标板固件架构理解和修改", codePath + 'firmware_arch.md',
            codePath: codePath + 'firmware_arch.py');
      },
    ),
  ];
}
