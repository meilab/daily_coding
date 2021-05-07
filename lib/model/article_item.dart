import 'package:flutter/material.dart';

class ArticleItem {
  const ArticleItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.routeName = '',
    this.keyword = '',
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final String subtitle;
  final String routeName;
  final String keyword;
  final void Function() onTap;

  @override
  String toString() {
    return '$runtimeType($title $routeName)';
  }
}

class ArticleItemCategory {
  const ArticleItemCategory({
    required this.name,
    required this.subName,
    required this.icon,
    required this.list,
    required this.onTap,
  });

  final String name;
  final String subName;
  final String icon;
  final List<ArticleItem> list;
  final void Function() onTap;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final ArticleItemCategory typedOther = other;
    return typedOther.name == name && typedOther.icon == icon;
  }

  @override
  int get hashCode => hashValues(name, icon);

  @override
  String toString() {
    return '$runtimeType($name)';
  }
}

class ArticleCategoryInfo {
  const ArticleCategoryInfo({
    required this.name,
    required this.subName,
    required this.icon,
    required this.articleFolder,
    required this.buildFunc,
  });

  final String name;
  final String subName;
  final String icon;
  final String articleFolder;
  final List<ArticleItem> Function(BuildContext, String) buildFunc;

  @override
  String toString() {
    return '$runtimeType($name)';
  }
}
