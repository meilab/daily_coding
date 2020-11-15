import 'dart:collection';
import 'dart:io';

import 'package:daily_coding/change_notifier/collect_notifier.dart';
import 'package:daily_coding/change_notifier/content_notifier.dart';
import 'package:daily_coding/change_notifier/search_notifier.dart';
import 'package:daily_coding/change_notifier/settings_notifier.dart';
import 'package:daily_coding/constants/constants.dart';
import 'package:daily_coding/model/article_item.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';
import 'package:daily_coding/pages/main/navigatormanager.dart';
import 'package:daily_coding/pages/notfound/notfound.dart';
import 'package:daily_coding/pages/splash/slpash.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'category/c/c_category.dart';
import 'category/daily_coding/daily_coding_category.dart';
import 'category/flutter/flutter_category.dart';
import 'category/react/react_category.dart';
import 'category/sca/sca_category.dart';
import 'category/two_lang/two_lang_category.dart';
import 'i18n/my_localizations_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:daily_coding/i18n/my_localizations_delegate.dart';

SystemUiOverlayStyle setNavigationBarTextColor(bool light) {
  return SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    systemNavigationBarDividerColor: null,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: null,
    statusBarIconBrightness: light ? Brightness.light : Brightness.dark,
    statusBarBrightness: light ? Brightness.dark : Brightness.light,
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    // 需要在initDio之后，因为要到github获取文章数据
    // 需要放在这个frame结束之后执行，否则会报错。
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _fetchArticles();

      _initArticlesAndSearchMap();
    });

    super.initState();
  }

  _initArticlesAndSearchMap() {
    List<ArticleItem> articleList = [];
    HashMap<String, ArticleItem> searchMap = HashMap<String, ArticleItem>();
    final SearchNotifier searchNotifier =
        Provider.of<SearchNotifier>(context, listen: false);

    buildClangCategoryList(context).forEach((value) {
      articleList.addAll(value.list);
    });
    buildScaCategoryList(context).forEach((value) {
      articleList.addAll(value.list);
    });
    buildFlutterCategoryList(context).forEach((value) {
      articleList.addAll(value.list);
    });
    buildReactCategoryList(context).forEach((value) {
      articleList.addAll(value.list);
    });
    articleList.addAll(buildDailyCodingCategoryList(context));
    articleList.addAll(buildTwolangCategoryList(context));

    Provider.of<CollectNotifier>(context, listen: false)
        .setArticles(articleList);

    articleList.forEach((articleItem) {
      //支持多个keyword用空格分隔
      List<String> splitArray = articleItem.keyword.split(KEY_SPLIT);
      for (String keyword in splitArray) {
        if (keyword.length > 0) {
          searchNotifier.addWord(keyword);
          searchMap[keyword] = articleItem;
        }
      }
    });

    searchNotifier.setSearchMap(searchMap);
  }

  _fetchArticles() async {
    final ContentNotifier contentNotifier =
        Provider.of<ContentNotifier>(context, listen: false);
    await contentNotifier.queryDailyCodingList();
    await contentNotifier.queryTwolangList();
  }

  @override
  Widget build(BuildContext context) {
    final SettingsNotifier settingsNotifier =
        Provider.of<SettingsNotifier>(context);
    final Locale locale = settingsNotifier.getCurrentLocale();

    if (Platform.isAndroid) {
      // 在组件渲染之后，再覆写状态栏颜色
      // 如果使用了APPBar，则需要修改brightness属性
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    return MaterialApp(
      // title: MyLocalizations.of(context).dailycoding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        MyLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: locale,
      supportedLocales: MyLocalizationsDelegate.supportedLocales(),
      home: NewHome(),
      // routes: <String, WidgetBuilder>{
      //   '/page2': (context) => Page2('静态Value'),
      // },
      onUnknownRoute: (RouteSettings setting) {
        return MaterialPageRoute(builder: (context) => NotFoundWidget());
      },
      navigatorKey: RouteManager.navigatorKey,
      navigatorObservers: [NavigatorManager.getInstance()],
    );
  }
}

class NewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: setNavigationBarTextColor(true),
      child: Scaffold(
        body: SplashPage(),
      ),
    );
  }
}
