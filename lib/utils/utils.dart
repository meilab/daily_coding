import 'dart:io';

import 'package:daily_coding/change_notifier/content_notifier.dart';
import 'package:daily_coding/routers/route_manager.dart';
import 'package:daily_coding/model/article_item.dart';
import 'package:daily_coding/model/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(String url) async {
  if (url.isEmpty) {
    return;
  }
  if (await canLaunch(url)) {
    await launchURL(url);
  } else {
    throw 'Could not launch $url';
  }
}

buildLoading() {
  return Positioned.fill(
    child: Stack(
      alignment: const FractionalOffset(0.5, 0.5),
      children: <Widget>[
        Opacity(
          child: Container(
            color: Colors.black,
          ),
          opacity: 0.6,
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: Colors.white),
            width: 150,
            height: 150,
            child: SpinKitRing(
              color: Color(0xff3D96FF),
              size: 60.0,
            ),
          ),
        )
      ],
    ),
  );
}

buildLoadingPage() {
  return Scaffold(
      appBar: AppBar(
        title: Text("Loading"),
      ),
      body: SpinKitRing(
        color: Color(0xff3D96FF),
        size: 60.0,
      ));
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

bool get isDesktop =>
    (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

bool get isMobile => (Platform.isAndroid || Platform.isIOS);

CardItem articleItemCategoryToCardItem(ArticleItemCategory item) => CardItem(
    title: item.name,
    subtitle: item.subName,
    icon: Icons.access_alarm,
    imgUrl: item.icon,
    onTap: item.onTap);

CardItem articleItemToCardItem(ArticleItem item) => CardItem(
    title: item.title,
    subtitle: item.subtitle,
    icon: item.icon,
    imgUrl: "",
    onTap: item.onTap);

onArticleTap(BuildContext context, String routeUrl, String mdPath,
    {String codePath = ""}) async {
  final ContentNotifier contentNotifier =
      Provider.of<ContentNotifier>(context, listen: false);

  await contentNotifier.getContentMd(context, mdPath);

  if (codePath != "") {
    await contentNotifier.getExampleCode(context, codePath);
  }

  RouterManager.router.navigateTo(context, routeUrl);
}

ArticleItemCategory buildCategoryCard(
    BuildContext context, ArticleCategoryInfo item, String routeUrl) {
  List<ArticleItem> articleList = item.buildFunc(context, item.articleFolder);

  return ArticleItemCategory(
    name: item.name,
    subName: item.subName,
    icon: item.icon,
    list: articleList,
    onTap: () {
      final ContentNotifier contentNotifier =
          Provider.of<ContentNotifier>(context, listen: false);

      final List<CardItem> cardList =
          articleList.map((item) => articleItemToCardItem(item)).toList();
      contentNotifier.setCardList(cardList);

      if (routeUrl != '') {
        RouterManager.router.navigateTo(context, routeUrl);
      }
    },
  );
}
