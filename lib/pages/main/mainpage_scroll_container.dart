import 'package:daily_coding/i18n/my_localizations.dart';
import 'package:daily_coding/routers/route_manager.dart';
import 'package:daily_coding/utils/local_storage.dart';
import 'package:daily_coding/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:daily_coding/pages/main/mainpage_page_header.dart';

import 'mainpage_page_layout.dart';

const double contentHeightFraction = 0.7;

class MainPageScrollContainer extends StatefulWidget {
  @override
  _MainPageScrollContainerState createState() =>
      _MainPageScrollContainerState();
}

class _MainPageScrollContainerState extends State<MainPageScrollContainer> {
  PageController pageController;
  ValueNotifier<double> notifier = ValueNotifier<double>(0);
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    final int pageIdx = localStorageManager.getInt('pageIdx') ?? 0;
    pageController =
        PageController(initialPage: pageIdx, viewportFraction: 0.7);
  }

  @override
  void didChangeDependencies() {
    final totalWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;
    final contentContainerHeight = totalHeight * contentHeightFraction;
    double viewportFraction = 0.9;

    // viewportFraction * totalWidth < contentContainerHeight
    //
    final fraction = contentContainerHeight / totalWidth;
    if (isDesktop) {
      if (totalWidth > 1500) {
        viewportFraction = 0.3;
      } else if (totalWidth < 400) {
        viewportFraction = 0.9;
      } else if (fraction > 0.7) {
        viewportFraction = 0.7;
      } else if (fraction > 0.5) {
        viewportFraction = 0.5;
      } else if (fraction > 0.3) {
        viewportFraction = 0.3;
      } else {
        viewportFraction = 0.9;
      }
    }
    final int pageIdx = localStorageManager.getInt('pageIdx') ?? 0;
    pageController = PageController(
        initialPage: pageIdx, viewportFraction: viewportFraction);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map> pages = [
      {
        'title': MyLocalizations.of(context).clangTitle(),
        'subtitle': MyLocalizations.of(context).clangSubtitle(),
        'imgUrl': 'assets/images/widget_bg.png',
        'routeUrl': "/clangContainer",
      },
      {
        'title': MyLocalizations.of(context).dailyCodingTitle(),
        'subtitle': MyLocalizations.of(context).dailyCodingSubtitle(),
        'imgUrl': 'assets/images/backend.jpg',
        'routeUrl': "/dailyCodingContainer",
      },
      {
        'title': MyLocalizations.of(context).twolangTitle(),
        'subtitle': MyLocalizations.of(context).twolangSubtitle(),
        'imgUrl': 'assets/images/widget_bg.png',
        'routeUrl': "/twoLangContainer",
      },
      {
        'title': MyLocalizations.of(context).flutterTitle(),
        'subtitle': MyLocalizations.of(context).flutterSubtitle(),
        'imgUrl': 'assets/images/backend.jpg',
        'routeUrl': "/flutterContainer",
      },
      {
        'title': MyLocalizations.of(context).scaTitle(),
        'subtitle': MyLocalizations.of(context).scaSubtitle(),
        'imgUrl': 'assets/images/pattern_bg.png',
        'routeUrl': "/scaContainer",
      },
      {
        'title': MyLocalizations.of(context).reactTitle(),
        'subtitle': MyLocalizations.of(context).reactSubtitle(),
        'imgUrl': 'assets/images/widget_bg.png',
        'routeUrl': "/reactContainer",
      },
    ];
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            ValueListenableBuilder(
              valueListenable: notifier,
              builder: (context, value, widget) {
                return Container(
                  color: Color.lerp(
                    Color(0xFF673AB7),
                    Color(0xFFF44336),
                    notifier.value,
                  ),
                );
              },
            ),
            MainPagePageHeader(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              height:
                  MediaQuery.of(context).size.height * contentHeightFraction,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: PageView(
                        controller: pageController
                          ..addListener(() {
                            notifier.value = pageController.offset /
                                pageController.position.maxScrollExtent;
                            final int idx = pageController.page.round() % 7;
                            if (idx != pageIndex) {
                              setState(() {
                                pageIndex = idx;
                              });
                              localStorageManager.putInt('pageIdx', idx);
                            }
                          }),
                        children: pages
                            .map((item) => PageWidget(
                                  item['title'],
                                  item['subtitle'],
                                  item['imgUrl'],
                                  () {
                                    RouterManager.router
                                        .navigateTo(context, item['routeUrl']);
                                  },
                                ))
                            .toList()),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 12, left: 48, right: 48),
                    child: ValueListenableBuilder(
                      valueListenable: notifier,
                      builder: (context, value, widget) {
                        return LinearProgressIndicator(
                          value: notifier.value,
                          valueColor: AlwaysStoppedAnimation(
                            Color.lerp(
                              Color(0xFF673AB7),
                              Color(0xFFF44336),
                              notifier.value,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
