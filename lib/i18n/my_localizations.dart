// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:daily_coding/i18n/intl_messages_all.dart';

// Information about how this file relates to i18n/stock_messages_all.dart and how the i18n files
// were generated can be found in i18n/regenerate.md.

class MyLocalizations {
  MyLocalizations(Locale locale) : _localeName = locale.toString();

  final String _localeName;

  static Future<MyLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((Object _) {
      return new MyLocalizations(locale);
    });
  }

  static MyLocalizations of(BuildContext context) {
    return Localizations.of<MyLocalizations>(context, MyLocalizations);
  }

  String title() {
    return Intl.message(
      'Xld',
      name: 'title',
      desc: 'Title for the Xld application',
      locale: _localeName,
    );
  }

  String author() => Intl.message(
        'author',
        name: 'author',
        desc: 'Label for the author',
        locale: _localeName,
      );

  String weixin() => Intl.message(
        'Weixin',
        name: 'weixin',
        desc: 'Label for the Title of weixin',
        locale: _localeName,
      );

  String settings() => Intl.message(
        'Settings',
        name: 'settings',
        desc: 'Label for the Settings tab',
        locale: _localeName,
      );

  String profile() => Intl.message(
        'PROFILE',
        name: 'profile',
        desc: 'Label for the profile tab',
        locale: _localeName,
      );

  String search() => Intl.message(
        'Search',
        name: 'search',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String dailycoding() => Intl.message(
        'Dailycoding',
        name: 'dailycoding',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String daily() => Intl.message(
        'daily',
        name: 'daily',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String coding() => Intl.message(
        'coding',
        name: 'coding',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String dailycodingSlogan() => Intl.message(
        'DailycodingSlogan',
        name: 'dailycodingSlogan',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String clangTitle() => Intl.message(
        'clangTitle',
        name: 'clangTitle',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String clangSubtitle() => Intl.message(
        'clangSubtitle',
        name: 'clangSubtitle',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String scaTitle() => Intl.message(
        'scaTitle',
        name: 'scaTitle',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String scaSubtitle() => Intl.message(
        'scaSubtitle',
        name: 'scaSubtitle',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String flutterTitle() => Intl.message(
        'flutterTitle',
        name: 'flutterTitle',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String flutterSubtitle() => Intl.message(
        'flutterSubtitle',
        name: 'flutterSubtitle',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String reactTitle() => Intl.message(
        'reactTitle',
        name: 'reactTitle',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String reactSubtitle() => Intl.message(
        'reactSubtitle',
        name: 'reactSubtitle',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String dailyCodingTitle() => Intl.message(
        'dailyCodingTitle',
        name: 'dailyCodingTitle',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String dailyCodingSubtitle() => Intl.message(
        'dailyCodingSubtitle',
        name: 'dailyCodingSubtitle',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String twolangTitle() => Intl.message(
        'twolangTitle',
        name: 'twolangTitle',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String twolangSubtitle() => Intl.message(
        'twolangSubtitle',
        name: 'twolangSubtitle',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String click2Copy() => Intl.message(
        'click2Copy',
        name: 'click2Copy',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String copyFinished() => Intl.message(
        'copyFinished',
        name: 'copyFinished',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String dailyCodingPromotion() => Intl.message(
        'dailyCodingPromotion',
        name: 'dailyCodingPromotion',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String demoCode() => Intl.message(
        'demoCode',
        name: 'demoCode',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String changeLocale() => Intl.message(
        'changeLocale',
        name: 'changeLocale',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String detail() => Intl.message(
        'detail',
        name: 'detail',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String favorite() => Intl.message(
        'favorite',
        name: 'favorite',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String collect() => Intl.message(
        'collect',
        name: 'collect',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
  String reviewCode() => Intl.message(
        'reviewCode',
        name: 'reviewCode',
        desc: 'Label for the Search Hinttext',
        locale: _localeName,
      );
}
