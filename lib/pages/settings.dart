// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daily_coding/change_notifier/settings_notifier.dart';
import 'package:daily_coding/i18n/my_localizations.dart';
import 'package:daily_coding/i18n/my_localizations_delegate.dart';
import 'package:daily_coding/theme/app_theme.dart';
import 'package:daily_coding/widgets/bottom_selector.dart';

class SettingsPage extends StatelessWidget {
  Widget buildSettingsPane(BuildContext context) {
    final SettingsNotifier settingsNotifier =
        Provider.of<SettingsNotifier>(context);

    final List<Widget> rows = <Widget>[
      ListTile(
        onTap: () {
          showModalBottomSheet<void>(
              context: context,
              // isScrollControlled: true,
              builder: (BuildContext context) {
                return BottomSelector(
                    options: MyLocalizationsDelegate.supportedLocales(),
                    title: MyLocalizations.of(context).changeLocale(),
                    optionTitle: renderLocaleOptionTitle,
                    curState: settingsNotifier.getCurrentLocale(),
                    onSelected: (Locale locale) {
                      settingsNotifier.setCurrentLocale(locale);
                    });
              });
        },
        leading: Icon(Icons.language),
        title: Text(MyLocalizations.of(context).changeLocale()),
        subtitle: Text(settingsNotifier.getCurrentLocale()?.languageCode ?? ""),
      ),
    ];

    return Container(
      color: AppTheme.homeBackground,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        children: rows,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(MyLocalizations.of(context).settings())),
        body: buildSettingsPane(context));
  }
}

Widget renderColorOptionTitle(dynamic color) => Container(
      color: color,
      // width: 120,
      height: 60,
      child: Text(""),
    );

Widget renderLocaleOptionTitle(dynamic locale) => Center(
    child: Text(locale?.languageCode ?? "" + "-" + locale?.countryCode ?? ""));
