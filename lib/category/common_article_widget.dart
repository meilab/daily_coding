import 'package:daily_coding/change_notifier/content_notifier.dart';
import 'package:daily_coding/i18n/my_localizations.dart';
import 'package:daily_coding/theme/images.dart';
import 'package:daily_coding/theme/metrics.dart';
import 'package:daily_coding/utils/local_storage.dart';
import 'package:daily_coding/utils/utils.dart';
import 'package:daily_coding/widgets/my_markdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:daily_coding/widgets/main_title_widget.dart';
import 'package:provider/provider.dart';

class CommonArticleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> collects;
    bool collected = false;
    final ContentNotifier contentNotifier =
        Provider.of<ContentNotifier>(context);
    final bool loading = contentNotifier.getLoading();
    final theme = Theme.of(context);
    final String markdownData = contentNotifier.getMarkdownData();
    final String title = contentNotifier.getTitle();
    collects = List<String>.from(localStorageManager.getStringList('collects'));
    collected = collects.indexWhere((element) => element == title) != -1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE6EBEB),
        elevation: 0,
        leading: IconButton(
          icon: const BackButtonIcon(),
          color: Colors.redAccent,
          onPressed: () {
            Navigator.maybePop(context, null);
          },
        ),
        brightness: Brightness.light,
        actions: <Widget>[
          IconButton(
            icon: Icon(collected ? Icons.star : Icons.star_border),
            color: Colors.black54,
            tooltip: MyLocalizations.of(context)!.collect(),
            onPressed: () {
              localStorageManager.putStringList('collects', collects);
            },
          ),
        ],
      ),
      body: Stack(children: [
        Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 800,
            ),
            padding: const EdgeInsets.all(MyMetrics.doubleBaseMargin),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  MainTitleWidget(title),
                  MyMarkdownWidget(markdownData: markdownData, style: 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Text(
                        MyLocalizations.of(context)!.dailyCodingPromotion(),
                        style: theme.textTheme.headline5
                            ?.copyWith(color: theme.primaryColor)),
                  ),
                  SizedBox(height: MyMetrics.baseMargin),
                  Image.asset(
                    MyImages.DAILY_CODING_VIDEO,
                    fit: BoxFit.cover,
                    width: 240,
                    height: 240,
                  )
                ],
              ),
            ),
          ),
        ),
        if (loading) buildLoading()
      ]),
    );
  }
}
