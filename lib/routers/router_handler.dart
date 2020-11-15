import 'package:daily_coding/category/c/c_category.dart';
import 'package:daily_coding/category/common_article_widget.dart';
import 'package:daily_coding/category/common_demo_widget.dart';
import 'package:daily_coding/category/daily_coding/daily_coding_category.dart';
import 'package:daily_coding/category/flutter/flutter_category.dart';
import 'package:daily_coding/category/react/react_category.dart';
import 'package:daily_coding/category/sca/sca_category.dart';
import 'package:daily_coding/category/two_lang/two_lang_category.dart';
import 'package:daily_coding/change_notifier/content_notifier.dart';
import 'package:daily_coding/i18n/my_localizations.dart';
import 'package:daily_coding/model/file_model.dart';
import 'package:daily_coding/pages/collect/collect_page.dart';
import 'package:daily_coding/pages/daily_coding_page.dart';
import 'package:daily_coding/pages/profile.dart';
import 'package:daily_coding/pages/search/search_mainpage_container.dart';
import 'package:daily_coding/pages/settings.dart';
import 'package:daily_coding/pages/two_lang_page.dart';
import 'package:daily_coding/utils/utils.dart';
import 'package:daily_coding/widgets/accordionList/accordion_list_mainpage.dart';
import 'package:daily_coding/widgets/animatedGrid/animated_grid_mainpage.dart';
import 'package:daily_coding/widgets/animatedList/animated_list_mainpage.dart';
import 'package:daily_coding/widgets/base_widget.dart';
import 'package:daily_coding/model/card_item.dart';
import 'package:daily_coding/widgets/embedList/embed_list_category_list.dart';
import 'package:daily_coding/widgets/embedList/embed_list_mainpage.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Container();
});

var profileHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ProfilePage();
});

var settingsHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SettingsPage();
});

var collectHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CollectPage();
});

var searchHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SearchMainPage();
});

var dailyCodingContainerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  final ContentNotifier contentNotifier = Provider.of<ContentNotifier>(context);
  final bool loading = contentNotifier.getLoading();
  // final List<FileModel> dailyCodingList = contentNotifier.getDailyCodinglist();
  // if (dailyCodingList.length <= 0) {
  //   contentNotifier.queryDailyCodingList();
  // }

  return TwoLangPage();
});

var dailyCodingDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CommonArticleWidget();
});

var twoLangDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CommonArticleWidget();
});

var twoLangContainerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DailyCodingPage();
});

var reactContainerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return EmbedListMainPage(
      buildReactCategoryList(context)
          .map((item) => articleItemCategoryToCardItem(item))
          .toList(),
      title: MyLocalizations.of(context).reactTitle());
});

var demoDetailHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  final title = params["title"][0];
  return BaseWidget(
    title,
    CommonDemoWidget(title),
  );
});

var scaContainerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AccordionListMainPage(
      buildScaCategoryList(context)
          .map((item) => articleItemCategoryToCardItem(item))
          .toList(),
      title: MyLocalizations.of(context).scaTitle());
});

var flutterContainerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AnimatedGridMainPage(
      buildFlutterCategoryList(context)
          .map((item) => articleItemCategoryToCardItem(item))
          .toList(),
      title: MyLocalizations.of(context).flutterTitle());
});

var clangContainerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return EmbedListMainPage(
      buildClangCategoryList(context)
          .map((item) => articleItemCategoryToCardItem(item))
          .toList(),
      title: MyLocalizations.of(context).clangTitle());
});

var clangCategoryContainerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  final ContentNotifier contentNotifier =
      Provider.of<ContentNotifier>(context, listen: false);
  String title = contentNotifier.getCardItem()?.title ?? "";
  List<CardItem> list = contentNotifier?.getCardList() ?? [];

  return EmbedListCategoryList(list, title);
});

var scaCategoryContainerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  final ContentNotifier contentNotifier =
      Provider.of<ContentNotifier>(context, listen: false);
  String title = contentNotifier.getCardItem()?.title ?? "";
  List<CardItem> list = contentNotifier?.getCardList() ?? [];

  return EmbedListCategoryList(list, title);
});

var reactCategoryContainerHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  final ContentNotifier contentNotifier =
      Provider.of<ContentNotifier>(context, listen: false);
  String title = contentNotifier.getCardItem()?.title ?? "";
  List<CardItem> list = contentNotifier?.getCardList() ?? [];

  return EmbedListCategoryList(list, title);
});
