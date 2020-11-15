import 'package:flutter/material.dart';

class CardItem {
  const CardItem({
    this.title,
    this.subtitle,
    this.icon,
    this.imgUrl,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String imgUrl;
  final void Function() onTap;

  @override
  String toString() {
    return '$runtimeType($title)';
  }
}
