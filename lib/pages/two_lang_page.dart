import 'package:daily_coding/category/two_lang/two_lang_category.dart';
import 'package:daily_coding/change_notifier/content_notifier.dart';
import 'package:daily_coding/i18n/my_localizations.dart';
import 'package:daily_coding/utils/utils.dart';
import 'package:daily_coding/widgets/animatedList/animated_list_mainpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TwoLangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ContentNotifier contentNotifier =
        Provider.of<ContentNotifier>(context);
    final bool loading = contentNotifier.getLoading();

    return loading
        ? buildLoadingPage()
        : AnimatedListMainPage(
            buildTwolangCategoryList(context)
                .map((item) => articleItemToCardItem(item))
                .toList(),
            title: MyLocalizations.of(context).twolangTitle());
  }
}
