import 'package:daily_coding/change_notifier/collect_notifier.dart';
import 'package:daily_coding/i18n/my_localizations.dart';
import 'package:daily_coding/category/c/c_category.dart';
import 'package:daily_coding/category/daily_coding/daily_coding_category.dart';
import 'package:daily_coding/category/flutter/flutter_category.dart';
import 'package:daily_coding/category/react/react_category.dart';
import 'package:daily_coding/category/sca/sca_category.dart';
import 'package:daily_coding/category/two_lang/two_lang_category.dart';
import 'package:daily_coding/model/article_item.dart';
import 'package:flutter/material.dart';
import 'package:daily_coding/pages/main/mainpage_scroll_container.dart';
import 'package:daily_coding/pages/splash/splashanimmanager.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late SplashAnimManager _splashAnimManager;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    Future.delayed(Duration(milliseconds: 300)).then((value) {
      _animationController.forward();
      Future.delayed(Duration(milliseconds: 1500), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainPageScrollContainer()),
            (Route<dynamic> rout) => false);
      });
    });

    List<ArticleItem> articleList = [];
    // 初始化所有article item
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
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<CollectNotifier>(context, listen: false)
          .setArticles(articleList);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    _splashAnimManager = SplashAnimManager(
      _animationController,
      screenWidth,
      (getTextWidth('Daily') - getTextWidth('Coding') - 4) / 2,
    );
    return Container(
      alignment: Alignment.center,
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, widget) {
              return Positioned(
                right: _splashAnimManager.animLeft.value,
                child: Text(
                  MyLocalizations.of(context)!.daily(),
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            },
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, widget) {
              return Positioned(
                left: _splashAnimManager.animRight.value,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Color.fromARGB(255, 253, 152, 39),
                  ),
                  child: Text(
                    MyLocalizations.of(context)!.coding(),
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  double getTextWidth(String text) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.w600,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.width;
  }
}
