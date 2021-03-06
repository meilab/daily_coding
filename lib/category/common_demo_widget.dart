import 'package:daily_coding/change_notifier/content_notifier.dart';
import 'package:daily_coding/i18n/my_localizations.dart';
import 'package:daily_coding/theme/images.dart';
import 'package:daily_coding/theme/metrics.dart';
import 'package:daily_coding/widgets/my_markdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:daily_coding/widgets/main_title_widget.dart';
import 'package:provider/provider.dart';

class CommonDemoWidget extends StatelessWidget {
  final String title;
  CommonDemoWidget(this.title);

  @override
  Widget build(BuildContext context) {
    final ContentNotifier contentNotifier =
        Provider.of<ContentNotifier>(context);
    final theme = Theme.of(context);
    final String markdownData = contentNotifier.getMarkdownData();

    return Center(
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
                child: Text(MyLocalizations.of(context)!.dailyCodingPromotion(),
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
    );
  }
}
