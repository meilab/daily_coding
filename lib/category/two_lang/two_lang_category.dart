import 'package:daily_coding/change_notifier/content_notifier.dart';
import 'package:daily_coding/model/file_model.dart';
import 'package:daily_coding/routers/route_manager.dart';
import 'package:daily_coding/model/article_item.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

var codePath = 'lib/category/twolang/';
List<ArticleItem> buildTwolangCategoryList(BuildContext context) {
  final ContentNotifier contentNotifier =
      Provider.of<ContentNotifier>(context, listen: false);
  List<FileModel> twolangList = contentNotifier.getTwolanglist();
  final List<ArticleItem> items = twolangList
      .map((FileModel article) => ArticleItem(
            icon: Icons.build,
            title: article.name,
            subtitle: article.name,
            keyword: article.name,
            onTap: () {
              final ContentNotifier contentNotifier =
                  Provider.of<ContentNotifier>(context, listen: false);

              contentNotifier.setTitle(article.name);

              contentNotifier.queryContentDetail(article.downloadUrl);

              RouterManager.router.navigateTo(context, "/twoLangDetail");
            },
          ))
      .toList();

  return items;
}
