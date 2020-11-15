import 'package:daily_coding/change_notifier/content_notifier.dart';
import 'package:daily_coding/model/file_model.dart';
import 'package:daily_coding/routers/route_manager.dart';
import 'package:flutter/material.dart';
import 'package:daily_coding/model/article_item.dart';
import 'package:provider/provider.dart';

var codePath = 'lib/category/dailycoding/';
List<ArticleItem> buildDailyCodingCategoryList(BuildContext context) {
  final ContentNotifier contentNotifier =
      Provider.of<ContentNotifier>(context, listen: false);
  List<FileModel> dailyCodingList = contentNotifier.getDailyCodinglist();
  final List<ArticleItem> items = dailyCodingList
      .map(
        (FileModel article) => ArticleItem(
          icon: Icons.build,
          title: article.name,
          subtitle: article.name,
          keyword: article.name,
          onTap: () {
            final ContentNotifier contentNotifier =
                Provider.of<ContentNotifier>(context, listen: false);

            contentNotifier.setTitle(article.name);

            contentNotifier.queryContentDetail(article.downloadUrl);

            RouterManager.router.navigateTo(context, "/dailyCodingDetail");
          },
        ),
      )
      .toList();

  return items;
}
